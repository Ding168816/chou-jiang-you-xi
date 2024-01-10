// @ts-nocheck

// 奖品名数组
let prizesArr = ["电动牙刷", "苹果电脑", "超级别墅", "兰博基尼", "一桶方便面", "星光雨伞", "来自大熊猫的赞赏", "100斤钞票"];
// 图片数组
let arrBigImg = ["./img/1.png", "./img/2.png", "./img/3.png",
"./img/4.png", "./img/5.png", "./img/6.png",
"./img/7.png", "./img/8.png", "./img/9-prizes.png"];

// 获取全部奖品单元格
let allPrizesLi = document.querySelectorAll('.prizes-li');
// 获取图片
let prizesImg = document.querySelectorAll('.pic');

let count = 0; // 转圈初始值
let isClick = true;
let index = 3;
let prizesPosition = 0; // 转到哪个位置

// 绑定img
for (let j = 0;j < prizesImg.length; j++) {
    prizesImg[j].src = arrBigImg[j];
}
let speed = 500; //转圈速度，值越大越慢

// 旋转函数
function roll() {

    // 速度衰减
    speed -= 50;
    if (speed <= 10) {
        speed = 10;
    }

    // 每次调用都去掉全部active类名
    for (let j = 0; j < allPrizesLi.length; j++) {
        allPrizesLi[j].classList.remove('active');
    }
    prizesPosition++;

    // 计算转圈次数
    if (prizesPosition >= allPrizesLi.length - 1) {
        prizesPosition = 0;
        count++;
    }

    allPrizesLi[prizesPosition].classList.add('active');
    let initSpeed = 500;
    let timer;
    let totalCount = 5; // 至少转动的总圈数

    // 满足转圈数和指定位置就停止
    if (count >= totalCount && (prizesPosition + 1) == index) {
        clearTimeout(timer);
        isClick = true;
        speed = initSpeed;
        timer = setTimeout(openDialog, 1000); // 等待1s打开弹窗
    } else {
        timer = setTimeout(roll, speed); // 不满足条件时调用定时器
        // 最后一圈减速
        if (count >= totalCount - 1 || speed <= 50) {
            speed += 100;
        }
    }
}

// 抽奖开始函数
function startDraw() {

    // 防止抽奖多次触发
    if (isClick) {
        count = 0;

        // 随机产生中奖位置
        index = Math.floor(Math.random() * prizesArr.length + 1);
        roll();
        isClick = false;
    }
}

function openDialog() {
    confirm(prizesArr[prizesPosition]);
}
