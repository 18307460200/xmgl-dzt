define("plugins/sm/scripts/sm4", function(require, exports, module) {

var SboxTable = new Array();
SboxTable[ 0] = new Array(0xd6,0x90,0xe9,0xfe,0xcc,0xe1,0x3d,0xb7,0x16,0xb6,0x14,0xc2,0x28,0xfb,0x2c,0x05);
SboxTable[ 1] = new Array(0x2b,0x67,0x9a,0x76,0x2a,0xbe,0x04,0xc3,0xaa,0x44,0x13,0x26,0x49,0x86,0x06,0x99);
SboxTable[ 2] = new Array(0x9c,0x42,0x50,0xf4,0x91,0xef,0x98,0x7a,0x33,0x54,0x0b,0x43,0xed,0xcf,0xac,0x62);
SboxTable[ 3] = new Array(0xe4,0xb3,0x1c,0xa9,0xc9,0x08,0xe8,0x95,0x80,0xdf,0x94,0xfa,0x75,0x8f,0x3f,0xa6);
SboxTable[ 4] = new Array(0x47,0x07,0xa7,0xfc,0xf3,0x73,0x17,0xba,0x83,0x59,0x3c,0x19,0xe6,0x85,0x4f,0xa8);
SboxTable[ 5] = new Array(0x68,0x6b,0x81,0xb2,0x71,0x64,0xda,0x8b,0xf8,0xeb,0x0f,0x4b,0x70,0x56,0x9d,0x35);
SboxTable[ 6] = new Array(0x1e,0x24,0x0e,0x5e,0x63,0x58,0xd1,0xa2,0x25,0x22,0x7c,0x3b,0x01,0x21,0x78,0x87);
SboxTable[ 7] = new Array(0xd4,0x00,0x46,0x57,0x9f,0xd3,0x27,0x52,0x4c,0x36,0x02,0xe7,0xa0,0xc4,0xc8,0x9e);
SboxTable[ 8] = new Array(0xea,0xbf,0x8a,0xd2,0x40,0xc7,0x38,0xb5,0xa3,0xf7,0xf2,0xce,0xf9,0x61,0x15,0xa1);
SboxTable[ 9] = new Array(0xe0,0xae,0x5d,0xa4,0x9b,0x34,0x1a,0x55,0xad,0x93,0x32,0x30,0xf5,0x8c,0xb1,0xe3);
SboxTable[10] = new Array(0x1d,0xf6,0xe2,0x2e,0x82,0x66,0xca,0x60,0xc0,0x29,0x23,0xab,0x0d,0x53,0x4e,0x6f);
SboxTable[11] = new Array(0xd5,0xdb,0x37,0x45,0xde,0xfd,0x8e,0x2f,0x03,0xff,0x6a,0x72,0x6d,0x6c,0x5b,0x51);
SboxTable[12] = new Array(0x8d,0x1b,0xaf,0x92,0xbb,0xdd,0xbc,0x7f,0x11,0xd9,0x5c,0x41,0x1f,0x10,0x5a,0xd8);
SboxTable[13] = new Array(0x0a,0xc1,0x31,0x88,0xa5,0xcd,0x7b,0xbd,0x2d,0x74,0xd0,0x12,0xb8,0xe5,0xb4,0xb0);
SboxTable[14] = new Array(0x89,0x69,0x97,0x4a,0x0c,0x96,0x77,0x7e,0x65,0xb9,0xf1,0x09,0xc5,0x6e,0xc6,0x84);
SboxTable[15] = new Array(0x18,0xf0,0x7d,0xec,0x3a,0xdc,0x4d,0x20,0x79,0xee,0x5f,0x3e,0xd7,0xcb,0x39,0x48);

var CK = new Array(
    0x00070e15,0x1c232a31,0x383f464d,0x545b6269,
    0x70777e85,0x8c939aa1,0xa8afb6bd,0xc4cbd2d9,
    0xe0e7eef5,0xfc030a11,0x181f262d,0x343b4249,
    0x50575e65,0x6c737a81,0x888f969d,0xa4abb2b9,
    0xc0c7ced5,0xdce3eaf1,0xf8ff060d,0x141b2229,
    0x30373e45,0x4c535a61,0x686f767d,0x848b9299,
    0xa0a7aeb5,0xbcc3cad1,0xd8dfe6ed,0xf4fb0209,
    0x10171e25,0x2c333a41,0x484f565d,0x646b7279
);

var FK = new Array(0xa3b1bac6,0x56aa3350,0x677d9197,0xb27022dc);


function bigxor(a, b){
  return a ^ b
}


function leftshift(a, n, size) {
  size = (!size)?32:size;
  n = n % size
  return (a << n) | (a >>> (size - n))
}

function prefixInteger(str, length) {
  return Array(length+1).join("0").split("").concat(String(str).split(""))
      .slice(-length).join("");
}

function sm4Sbox(a) {
  var b1 = SboxTable[(a & 0xf0000000) >>> 28][(a & 0x0f000000) >>> 24]
  var b2 = SboxTable[(a & 0x00f00000) >>> 20][(a & 0x000f0000) >>> 16]
  var b3 = SboxTable[(a & 0x0000f000) >>> 12][(a & 0x00000f00) >>>  8]
  var b4 = SboxTable[(a & 0x000000f0) >>>  4][(a & 0x0000000f) >>>  0]
  return (b1 << 24) | (b2 << 16) | (b3 << 8) | (b4 << 0)
}

function GET_ULONG_BE (a) {
  a = sm4Sbox(a)
  return bigxor(bigxor(bigxor(a, leftshift(a, 2)), bigxor(leftshift(a, 10), leftshift(a, 18))), leftshift(a, 24))
}

function PUT_ULONG_BE(b) {
  b = sm4Sbox(b)
  return bigxor(b, bigxor(leftshift(b, 13), leftshift(b, 23)));
}

function sm4_getkey (MK) {
  var  K = new Array();
  var rk = new Array();
  K[0] = bigxor(MK[0], FK[0]);
  K[1] = bigxor(MK[1], FK[1]);
  K[2] = bigxor(MK[2], FK[2]);
  K[3] = bigxor(MK[3], FK[3]);

  for (var i = 0; i < 32; i++) {
    K[i+4] = bigxor(K[i], PUT_ULONG_BE(bigxor(bigxor(K[i+1], K[i+2]), bigxor(K[i+3], CK[i]))));
    rk[i] = K[i+4].toString(16);
  };
  return rk;
}

function KJUR_encrypt_sm4 (messsage, key, method) {
  method = (!method)?'cbc':method
  var MK = key;
  var X = messsage;
  var rk = sm4_getkey(MK);
  for (var i = 0; i < 32; i++) {
    X[i+4] = bigxor(X[i], GET_ULONG_BE(bigxor(bigxor(X[i+1], X[i+2]), bigxor(X[i+3], parseInt(rk[i], 16)))))
  };
  var Y = new Array(X[35].toString(16), X[34].toString(16), X[33].toString(16), X[32].toString(16))
  return Y;
}

function KJUR_decrypt_sm4 (ciphertext, key, method) {
  method = (!method)?'cbc':method;
  var MK = key;
  var X = ciphertext;
  var frk = sm4_getkey(MK);
  var rk = new Array()
  for (var i = frk.length - 1; i >= 0; i--) {
    rk[frk.length - 1 - i] = frk[i]
  };
  for (var i = 0; i < 32; i++) {
    X[i+4] = bigxor(X[i], GET_ULONG_BE(bigxor(bigxor(X[i+1], X[i+2]), bigxor(X[i+3], parseInt(rk[i], 16)))))
  };
  var Y = new Array(X[35].toString(16), X[34].toString(16), X[33].toString(16), X[32].toString(16))
  return Y;
}

/*********************************/

function dataToHexCharCode(data,flag) {  //字符串转16进制
  if(!data){
    return "";
  }
  var hexCharCode = [];
  for(var i = 0; i < data.length; i++) {
	var code = (data[i]).toString(16);
	if(code.length < 2){
		code = '0' + code;
	}
    hexCharCode.push(code);
  }
  if(flag){
    return hexCharCode.join("")
  }
  return  '0x' + hexCharCode.join("");
}

function hexCharCodeToData(hexCharCodeStr) {
  var trimedStr = hexCharCodeStr.trim();
  var rawStr = trimedStr.substr(0,2).toLowerCase() === "0x"? trimedStr.substr(2):trimedStr;
  var len = rawStr.length;
  if(len % 2 !== 0) {
    return "";
  }
  var curCharCode;
  var resultStr = [];
  for(var i = 0; i < len;i = i + 2) {
    curCharCode = parseInt(rawStr.substr(i, 2), 16);
    resultStr.push(curCharCode);
  }
  return resultStr;
}

function GetWords(hexStr) {
	var words = [];
	var hexStrLength = hexStr.length;
	for (var i = 0; i < hexStrLength; i += 2) {
		words[words.length] = parseInt(hexStr.substr(i, 2), 16);
	}
	return words;
}

function dataAddHexLength(blockData,hexLength){ //字符串后尾补0，使字符串长度达16位
  while((blockData.length % 16) != 0 || blockData.length < 16) {
	blockData = blockData.concat(hexCharCodeToData(hexLength));  
  }
  return blockData;
}

function dataTo16Array(data,flag){ //字符串分成四组，每组字符串转化成16进制
  if(!flag){
    flag = false;
  }
  var msg_array = [];
  for(var i = 0; i < 4; i ++){
    msg_array.push(dataToHexCharCode(data.slice(i * 4,(i + 1) * 4),flag).toString(16))
  }
  return msg_array;
}

function ciphertextToInt(ciphertext){ //译码4维数组进行处理拼凑成一个整体字符串
  var res_ciphertext = [];
  for(var i = 0; i < ciphertext.length; i++){
    if(ciphertext[i].substring(0,1) == '-'){
      var ciphertext_16H = '0x' + ciphertext[i].substring(1);
      var value = (0xffffffff - ciphertext_16H + 1).toString(16);
      res_ciphertext.push(h16AddZero(value))
    }else{
      res_ciphertext.push(h16AddZero(ciphertext[i]));
    }
  }
  return res_ciphertext;
}

function h16AddZero(str){ //译码，若字符串长度小于8位时，前面加0补齐，长度凑成8位
  while(str.length < 8) {
    str = "0" + str;
  }
  return str
}

/***********sm4编码*************/
function sm4_encrypt_ecb(message,key){
  var keyData = CryptoJS.enc.Utf8.parse(key);	
  keyData = GetWords(keyData.toString());	
  keyData = dataAddHexLength(keyData,"00");
  if(keyData.length > 16){
	  keyData = keyData.slice(0,16);
  }
  var key_array = dataTo16Array(keyData);
  var msgData = CryptoJS.enc.Utf8.parse(message);
  msgData = GetWords(msgData.toString());
  var p = 16 - (msgData.length % 16);
  p = p.toString(16);
  if(p.length < 2){
	 p = "0" + p;
  }
  if(p == "10"){
	  msgData = msgData.concat(dataAddHexLength([],p));
  }else{
	  msgData = dataAddHexLength(msgData,p);
  }
  var block = Math.floor(msgData.length / 16);
  var ciphertext = [];
  for(var i = 0; i < block; i ++){
	  var blockData = msgData.slice(i * 16,(i + 1) * 16);
	  var msg_array = dataTo16Array(blockData);
	  ciphertext = ciphertext.concat(KJUR_encrypt_sm4(msg_array, key_array));
  }
  var res_ciphertext = ciphertextToInt(ciphertext)
  var resultHex = res_ciphertext.join('');
  return hex_to_binary(resultHex);
}

/*************sm4译码******************/

function GetHex(arr) {
	var words = [];
	var j = 0;
	for (var i = 0; i < arr.length * 2; i += 2) {
		words[i >>> 3] |= parseInt(arr[j]) << (24 - (i % 8) * 4);
		j++
	}
	var wordArray = new CryptoJS.lib.WordArray.init(words,arr.length);
	return wordArray
}
		
function sm4_decrypt_ecb(msgData,key){
  var keyData = CryptoJS.enc.Utf8.parse(key);	
  keyData = GetWords(keyData.toString());	
  keyData = dataAddHexLength(keyData,"00");
  if(keyData.length > 16){
	  keyData = keyData.slice(0,16);
  }
  var key_array = dataTo16Array(keyData);
  var block = msgData.length / 16;
  var plainText = [];
  for(var i = 0; i < block; i ++){
	  var blockData = msgData.slice(i * 16,(i + 1) * 16);
	  var msg_array = dataTo16Array(blockData);
	  plainText = plainText.concat(KJUR_decrypt_sm4(msg_array, key_array));
  }
  var res_plainText = ciphertextToInt(plainText);
  var resultHex = res_plainText.join('');
  var binary = hex_to_binary(resultHex);
  if(binary.length > 0){
	  var spaceNum = binary[binary.length - 1];
	  if(spaceNum > 0){
		  binary = binary.splice(0,binary.length - spaceNum);
	  }
  }
  var wordArray = GetHex(binary);
  var decryptData = CryptoJS.enc.Utf8.stringify(wordArray);
  return decryptData;
}
 
window.sm4_encrypt_ecb = sm4_encrypt_ecb;
window.sm4_decrypt_ecb = sm4_decrypt_ecb;

function sm4_encrypt_cbc(content, key ,iv) {
  iv = iv || key;
  var keyData = CryptoJS.enc.Utf8.parse(key);	
  keyData = GetWords(keyData.toString());	
  keyData = dataAddHexLength(keyData,"00");
  if(keyData.length > 16){
	  keyData = keyData.slice(0,16);
  }
  var key_array = dataTo16Array(keyData);
  
  var ivData = CryptoJS.enc.Utf8.parse(iv);	
  ivData = GetWords(ivData.toString());	
  ivData = dataAddHexLength(ivData,"00");
  if(ivData.length > 16){
	  ivData = ivData.slice(0,16);
  }
 
  var msgData = CryptoJS.enc.Utf8.parse(content);
  msgData = GetWords(msgData.toString());
  var p = 16 - (msgData.length % 16);
  p = p.toString(16);
  if(p.length < 2){
	 p = "0" + p;
  }
  if(p == "10"){
	  msgData = msgData.concat(dataAddHexLength([],p));
  }else{
	  msgData = dataAddHexLength(msgData,p);
  }
  
  var block = Math.floor(msgData.length / 16);
  var ciphertext = [];
  for(var i = 0; i < block; i ++){
	  var message = [];
	  var blockData = msgData.slice(i * 16,(i + 1) * 16);
	  for(var k = 0; k < 16; k ++){
		  message.push(bigxor(ivData[k], blockData[k]));
	  }
	  var msg_array = dataTo16Array(message);
	  var encryptData = KJUR_encrypt_sm4(msg_array, key_array);
	  encryptData = ciphertextToInt(encryptData);
	  var resultHex = encryptData.join('');
	  ivData = hex_to_binary(resultHex);
	  ciphertext = ciphertext.concat(ivData);
  }
  return ciphertext;
}

function sm4_decrypt_cbc(msgData, key,iv) {
  iv = iv || key;
  var keyData = CryptoJS.enc.Utf8.parse(key);	
  keyData = GetWords(keyData.toString());	
  keyData = dataAddHexLength(keyData,"00");
  if(keyData.length > 16){
	  keyData = keyData.slice(0,16);
  }
  var key_array = dataTo16Array(keyData);
  
  var ivData = CryptoJS.enc.Utf8.parse(iv);	
  ivData = GetWords(ivData.toString());	
  ivData = dataAddHexLength(ivData,"00");
  if(ivData.length > 16){
	  ivData = ivData.slice(0,16);
  }

  var block = msgData.length / 16;
  var binary = [];
  for(var i = (block - 1); i >= 0 ; i --){
	  var tempIVData = ivData;
	  if(i > 0){
          tempIVData = msgData.slice((i - 1) * 16,i * 16);
      }
	  var blockData = msgData.slice(i * 16, (i + 1) * 16);
	  var msg_array = dataTo16Array(blockData);
      var plainText = KJUR_decrypt_sm4(msg_array, key_array);
	  var res_plainText = ciphertextToInt(plainText);
	  var resultHex = res_plainText.join('');
	  var decryptBlockData = hex_to_binary(resultHex);
	  for(var j = decryptBlockData.length - 1; j >= 0 ;j --){
          binary.push(bigxor(decryptBlockData[j], tempIVData[j]))
      }
  }
  binary.reverse();
  if(binary.length > 0){
	  var spaceNum = binary[binary.length - 1];
	  if(spaceNum > 0){
		  binary = binary.splice(0,binary.length - spaceNum);
	  }
  }
  var wordArray = GetHex(binary);
  var decryptData = CryptoJS.enc.Utf8.stringify(wordArray);
  return decryptData;
}

window.sm4_encrypt_cbc = sm4_encrypt_cbc;
window.sm4_decrypt_cbc = sm4_decrypt_cbc;

function hex_to_binary(hexStr) {
	var binary = new Array();
	for (var i=0; i<hexStr.length/2; i++) {
		var h = hexStr.substr(i*2, 2);
		binary[i] = parseInt(h,16);        
	}    
	return binary;
}

var hD='0123456789ABCDEF';
function dec2hex(d) {
	var h = hD.substr(d&15,1);
	while (d>15) {
		d>>=4;
		h=hD.substr(d&15,1)+h;
	}
	return h.toLowerCase();
}

function binary_to_hex(output) {
	var hexText = "";
	for (i=0; i<output.length; i ++) {
		 hexText = hexText + (output[i]<16?"0":"") + dec2hex(output[i]);
    }
	return hexText;
}

var base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
function binary_to_base64(input) {
  var ret = new Array();
  var i = 0;
  var j = 0;
  var char_array_3 = new Array(3);
  var char_array_4 = new Array(4);
  var in_len = input.length;
  var pos = 0;
  while (in_len--){
	  char_array_3[i++] = input[pos++];
	  if (i == 3){
		  char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
		  char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
		  char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
		  char_array_4[3] = char_array_3[2] & 0x3f;
		  for (i = 0; (i <4) ; i++)
			  ret += base64_chars.charAt(char_array_4[i]);
		  i = 0;
	  }
  }
  if (i){
	  for (j = i; j < 3; j++)
		  char_array_3[j] = 0;
	  char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
	  char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
	  char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
	  char_array_4[3] = char_array_3[2] & 0x3f;
	  for (j = 0; (j < i + 1); j++)
		  ret += base64_chars.charAt(char_array_4[j]);
	  while ((i++ < 3))
		  ret += '=';
  }
  return ret;
}

var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
function base64_to_binary(input) {
	var output = new Array();
	var chr1, chr2, chr3;
	var enc1, enc2, enc3, enc4;
	var i = 0;

	var orig_input = input;
	input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
	if (orig_input != input)
		alert ("Warning! Characters outside Base64 range in input string ignored.");
	if (input.length % 4) {
		alert ("Error: Input length is not a multiple of 4 bytes.");
		return "";
	}
	
	var j=0;
	while (i < input.length) {

		enc1 = keyStr.indexOf(input.charAt(i++));
		enc2 = keyStr.indexOf(input.charAt(i++));
		enc3 = keyStr.indexOf(input.charAt(i++));
		enc4 = keyStr.indexOf(input.charAt(i++));

		chr1 = (enc1 << 2) | (enc2 >> 4);
		chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
		chr3 = ((enc3 & 3) << 6) | enc4;
		
		output[j++] = chr1;
		if (enc3 != 64)
		  output[j++] = chr2;
		if (enc4 != 64)
		  output[j++] = chr3;
		  
	}
	return output;
}
	
window.binary_to_base64 = binary_to_base64;
window.base64_to_binary = base64_to_binary;
window.hex_to_binary = hex_to_binary;
window.binary_to_hex = binary_to_hex;

});