import os, platform, subprocess, dotbot

class Yum(dotbot.Plugin):
    _directive = "yum"

    def can_handle(self, directive):
        return directive == self._directive

    def handle(self, directive, data):
        if directive != self._directive:
            raise ValueError('yum cannot handle directive {0}'.format(directive))
        success = self._process_packages(data)
        if success:
            self._log.info('All packages have been installed')
        else:
            self._log.error('Some packages were not installed')

        return success


    def _process_packages(self, packages):
        defaults = self._context.defaults().get('yum', {})

        if isinstance(packages, str):
            # single package
            return self._install(packages, defaults)
        elif isinstance(packages, list):
            # multiple packages in list, one install for all
            pkg_list = ' '.join(packages)
            return self._install(pkg_list, defaults)
        elif isinstance(packages, dict):
            # multiple packages in dict with possible options, one install per package
            for pkg_name, pkg_opts in packages.items():
                yum_opts = {}
                if isinstance(pkg_opts, dict):
                    yum_opts = self._merge_dicts(defaults, pkg_opts)
                elif pkg_opts:
                    yum_opts = self._merge_dicts(defaults, {'options': pkg_opts})
                else:
                    yum_opts = defaults

                if not self._install(pkg_name, yum_opts):
                    return False

            return True
        else:
            self._log.error("Invalid package specification [{0}]".format(packages))
            return False


    def _install(self, packages, pkg_opts={}):
        if not packages:
            self._log.info('Unexpected empty packages specification, skipping')
            return True

        is_sudo = pkg_opts.get('sudo', False)
        if os.geteuid() != 0 and is_sudo == False:
            msg = 'Need root permissions to install packages'
            self._log.error(msg)
            raise YumError(msg)

        cwd = self._context.base_directory()

        with open(os.devnull, 'w') as devnull:
            stdin = stdout = stderr = devnull

            if pkg_opts.get('stdin', False) == True:
                stdin = None
            if pkg_opts.get('stdout', False) == True:
                stdout = None
            if pkg_opts.get('stderr', False) == True:
                stderr = None

            if 'options' not in pkg_opts:
                pkg_opts['options'] = ''

            sudo_str = 'sudo ' if is_sudo else ''
            group_str = ' group' if pkg_opts.get('group', False) == True else ''

            self._log.info("Installing [{0}] with options [{1}]".format(packages, pkg_opts['options']))

            cmd = "{0}yum {1} {2}install {3}".format(sudo_str, pkg_opts['options'], group_str, packages)
            ret_code = subprocess.call(cmd, shell=True, stdin=stdin, stdout=stdout, stderr=stderr, cwd=cwd)

            if ret_code != 0:
                self._log.error("Failed to{0}install [{1}]".format(group_str, packages))
                return False
            return True


    def _merge_dicts(self, *dict_args):
        """
        Given any number of dicts, shallow copy and merge into a new dict,
        precedence goes to key value pairs in latter dicts.
        """
        result = {}
        for dictionary in dict_args:
            result.update(dictionary)
        return result


class YumError(Exception):
    pass
