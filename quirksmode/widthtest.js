var writeroot,
	testEl,
	testLayer,
	counter=0;

var lipsumButtonHtml = '<input type=button onclick="removeLoremIpsum()" value="Remove Lorem Ipsum">';


function removeLoremIpsum () {
    document.getElementById("loremipsum").innerHTML = "";
    refreshTest({type: "DOM elt removal"});
}

function init(evt) {
	writeroot = document.getElementById('writeroot');
	testEl = document.getElementById('testEl');
	testLayer = document.getElementById('huge');
	document.getElementById('testButton').onclick = refreshTest;
	document.getElementById('removeLipsumButton').onclick = removeLoremIpsum;

//	document.getElementById('stretch').onclick = stretchDiv;

	var lipsum = document.getElementById('loremipsum');
	lipsum.innerHTML = lipsumButtonHtml + '<br>' + new Array(250).join('Lorem ipsum dolor sit amet. ');

	refreshTest(evt);
	refreshTest(evt); //repeat so that the writeroot is filled with data at the moment its height is measured.
}

function refreshTest(evt) {
	log('Iteration ' + counter);
	log('Last event: ' + (evt ? evt.type : ""));
	counter +=1;
	log('screen.width/height = ' + screen.width + ' / ' + screen.height); // + ' = ' + screen.width/screen.height);
	log('documentElement.offset = ' + document.documentElement.offsetWidth + ' / ' + document.documentElement.offsetHeight);
	log('documentElement.client = ' + document.documentElement.clientWidth + ' / ' + document.documentElement.clientHeight);
//	log('documentElement.scroll = ' + document.documentElement.scrollLeft + ' / ' + document.documentElement.scrollTop);
//	log('writeroot.offset = ' + writeroot.offsetWidth + ' / ' + writeroot.offsetHeight);
	log('window.innerWidth/Height = ' + window.innerWidth + ' / ' + window.innerHeight);
//	log('window.outerWidth/Height = ' + window.outerWidth + ' / ' + window.outerHeight);
	if (window.devicePixelRatio) {
		log('window.devicePixelRatio = ' + window.devicePixelRatio);
	} else {
		log ('window.devicePixelRatio not supported');
	}
	if (screen.deviceXDPI) {
		log('screen.deviceX/YDPI= ' + screen.deviceXDPI +' / ' + screen.deviceYDPI);
		log('screen.logicalX/YDPI= ' + screen.logicalXDPI +' / ' + screen.logicalYDPI);
	}
	log('window.page = ' + window.pageXOffset+ ' / ' + window.pageYOffset);
	set();
}


var logString;

function log(msg) {
	logString += msg + '<br>';
}

function set () {
	// fixed positioning is not what we want on mobile when the page is zoomed, we have to emulate it width absolute
	// pageX/YOffset is more reliable on IE11 mobile that (docEl / body).scrollLeft/Top when zoomed
	var doc = document, docEl = document.documentElement;
	var right = document.documentElement.clientWidth - (window.pageXOffset) - window.innerWidth;
	writeroot.style.right = (right > 0 ? right : 0) + "px";
	writeroot.style.top = (window.pageYOffset) + "px";

	writeroot.innerHTML = logString;
	logString = '';
}

if (!window.onload) {
	window.onload = init;
}

document.onscroll = window.onresize = refreshTest;