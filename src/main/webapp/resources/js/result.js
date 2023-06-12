const copyBtn = document.querySelector('.copy_btn');
const facebookShare = document.querySelector('.facebook_share');

$(function() {
	let url = window.location.href;
	let img = $('.result_img img').attr('src');
	$("meta[property='og:url']").attr("content", url);
	$("meta[property='og:image']").attr("content", img);
});

function copyUrl() {
    let tmp = document.createElement('input');
    let url = window.location.href;

    document.body.appendChild(tmp);
    tmp.value = url;
    tmp.select();
    document.execCommand("copy");
    document.body.removeChild(tmp);

    showModal("알림", "URL이 복사되었습니다.");
}

function shareFacebook() {
	let url = window.location.href;
	let facebook = 'http://www.facebook.com/sharer/sharer.php?u=';
	let link = facebook + url;
	window.open(link);
}

copyBtn.addEventListener('click', copyUrl);
facebookShare.addEventListener('click', shareFacebook);
