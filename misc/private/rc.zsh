# zinit wait lucid light-mode for soimort/you-get
# alias yg='you-get'

if _is_callable reveal-md; then
  alias rv='reveal-md --highlight-theme github --theme white --watch'
  alias rvs='reveal-md --highlight-theme github --theme white --static revealjs_output'
fi

if _is_callable yt-dlp; then
  alias yd='yt-dlp --write-auto-sub --ignore-errors'
  alias yd2mp4='yt-dlp --write-auto-sub --ignore-errors --recode-video mp4'
  alias yda='yt-dlp -i -o "%(title)s.%(ext)s" --embed-thumbnail --extract-audio --audio-format mp3 --audio-quality 0'
fi
