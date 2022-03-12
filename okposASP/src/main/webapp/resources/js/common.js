// 기본 버튼 hover
function switchColorBgc() {
    var currentColor = $(this).css('color');
    var currentBgc = $(this).css('background-color');
    $(this).css('color', currentBgc);
    $(this).css('background-color', currentColor);

	$(this).css('cursor', 'pointer');
};
$('.btn').hover(switchColorBgc, switchColorBgc);

// 그라데이션 버튼 hover
function btnGradientBlakc1() {
    $(this).css('color', 'white');
    $(this).css('background', 'linear-gradient(to bottom, #888, #333)');
};
function btnGradientBlack2() {
    $(this).css('color', 'white');
    $(this).css('background', 'linear-gradient(to bottom, #666, #333)');
};
$('.btn.btn-gradient-black').hover(btnGradientBlack2, btnGradientBlakc1);
function btnGradientLightgray1() {
    $(this).css('color', 'gray');
    $(this).css('background', 'linear-gradient(to bottom, white, #dbdbdb)');
};
function btnGradientLightgray2() {
    $(this).css('color', 'black');
    $(this).css('background', 'linear-gradient(to bottom, #b3b3b3, #c3c3c3)');
};
$('.btn.btn-gradient-lightgray').hover(btnGradientLightgray2, btnGradientLightgray1);
function btnGradientDanger1() {
    $(this).css('color', 'white');
    $(this).css('background', 'linear-gradient(to bottom, #fa8772, #df3023)');
};
function btnGradientDanger2() {
    $(this).css('color', 'white');
    $(this).css('background', 'linear-gradient(to bottom, #b62116, #df3023)');
};
$('.btn.btn-gradient-danger').hover(btnGradientDanger2, btnGradientDanger1);
function btnGradientOrange1() {
    $(this).css('color', 'white');
    $(this).css('background', 'linear-gradient(to bottom, #ffbf83, #ff816b)');
};
function btnGradientOrange2() {
    $(this).css('color', 'white');
    $(this).css('background', 'linear-gradient(to bottom, #ff816b, #fa8772)');
};
$('.btn.btn-gradient-orange').hover(btnGradientOrange2, btnGradientOrange1);
function btnGradientGreentea1() {
    $(this).css('color', 'white');
    $(this).css('background', 'linear-gradient(to bottom, #7fc04e, #55a518)');
};
function btnGradientGreentea2() {
    $(this).css('color', 'white');
    $(this).css('background', 'linear-gradient(to bottom, #509c16, #55a518)');
};
$('.btn.btn-gradient-greentea').hover(btnGradientGreentea2, btnGradientGreentea1);
