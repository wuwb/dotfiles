/*
 * @lc app=leetcode id=1 lang=javascript
 *
 * [1] Two Sum
 */
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
const twoSum = function(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        for (let j = i+1; j < nums.length; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return 'No complement';
};
// var twoSum = function(nums, target) {
//     for (let i = 0; i < nums.length; i++) {
//         const comp = target - nums[i];
//         const index = nums.indexOf(comp);
//         if (index !== -1 && index !== i) {
//             return [i, index];
//         }
//     }
//     return 'No complement';
// };
// const twoSum = (nums, target) => {
//     let numsMap = new Map();
//     for (i = 0; i < nums.length; i++) {
//         const complement = target - nums[i];
//         if (numsMap.has(complement)) {
//             return [numsMap.get(complement), i];
//         }
//         numsMap.set(nums[i], i);
//     }
//     throw new Error("No two sum solution found.");
// };
