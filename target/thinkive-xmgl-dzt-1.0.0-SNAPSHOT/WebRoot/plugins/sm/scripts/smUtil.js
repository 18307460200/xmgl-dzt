define("plugins/sm/scripts/smUtil", function(require, exports, module) {
	require("plugins/sm/scripts/core-min");
	require("plugins/sm/scripts/sm3");
	require("plugins/sm/scripts/sm2");
	require("plugins/sm/scripts/sm4");
    $.crypto = $.crypto || {};
	$.crypto.sm2 = {
		/**
		 * 功能:sm2加密
		 * 参数: pubX:加密公钥X
		 *       pubY:加密公钥Y
		 *       content：原文
		 * 返回:密文
		 */
		encrypt : function(pubX,pubY,content){
			if(pubX.length > 0 && pubY.length > 0 && content.length > 0){
				var cipher = new SM2Cipher(0);
				var userKey = cipher.CreatePoint(pubX, pubY);
				var msgData = CryptoJS.enc.Utf8.parse(content);
				msgData = cipher.GetWords(msgData.toString());
				var encryptData = cipher.Encrypt(userKey, msgData);
				return "04" + encryptData;
			}
			return "";
		},
		/**
		 * 功能:sm2解密
		 * 参数: privKey:加密私钥
		 *       content：密文
		 * 返回:原文
		 */
		decrypt : function(privKey,content){
			 if(privKey.length > 0 && content.length > 96){
				 content = content.toLowerCase();
				 content = content.substring(2,content.length);
				 var privateKey = new BigInteger(privKey, 16);
				 var cipher = new SM2Cipher(0);
				 var decryptData = cipher.Decrypt(privateKey, content);
				 return decryptData;
			 }
			 return "";
		}
	};
	$.crypto.sm3 =  {
		/**
		 * 功能:sm3签名
		 * 参数: content：内容
		 * 返回: Hash值
		 */
		hash : function(content){
			if(content.length > 0){
				return tksm3(content);
			}
			return "";
		}  
	};
    $.crypto.sm4 = {
		/**
		 * 功能:sm4加密
		 * 参数: key:加密秘钥
		 *       content：原文
		 * 返回:密文
		 */
		ecbEncrypt : function(key,content){
			if(key.length > 0 && content.length > 0){
				var binary = sm4_encrypt_ecb(content,key);
				return binary_to_base64(binary);
			}
			return "";
		},
		/**
		 * 功能:sm4解密
		 * 参数: key:加密秘钥
		 *       content：密文 
		 * 返回:原文
		 */
		ecbDecrypt : function(key,content){
			if(key.length > 0 && content.length > 0){
				var binary = base64_to_binary(content);
				var result = sm4_decrypt_ecb(binary,key);
				return result;
			}
			return "";
		},
		/**
		 * 功能:sm4加密
		 * 参数: key:加密秘钥
		 *       iv:加密矢量
		 *       content：原文
		 * 返回:密文
		 */
		cbcEncrypt : function(key,iv,content){
			if(key.length > 0 && content.length > 0){
				var binary = sm4_encrypt_cbc(content,key,iv);
				return binary_to_base64(binary);
			}
			return "";
		},
		/**
		 * 功能:sm4解密
		 * 参数: key:加密秘钥
		 *       iv:加密矢量
		 *       content：密文
		 * 返回:原文
		 */
		cbcDecrypt : function(key,iv,content){
			if(key.length > 0 && content.length > 0){
				var binary = base64_to_binary(content);
				var result = sm4_decrypt_cbc(binary,key,iv);
				return result;
			}
			return "";
		}
	};
});