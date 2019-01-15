package util;

import java.security.Key;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class CipherUtil {
		private final static byte[] iv = new byte[] { 
				(byte)0x8E,0x12,0x39,(byte)0x9c,
				      0x07,0x72,0x6F,(byte)0x5A,
				(byte)0x8E,0x12,0x39,(byte)0x9c,
				      0x07,0x72,0x6F,(byte)0x5A};				      
		static Cipher cipher;
		static {

			try {

				cipher = Cipher.getInstance("AES/CBC/PKCS5Padding"); 
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		public static byte[] makeKey(String key) {
			int len = key.length();
			char ch = 'A';
			for(int i=len;i < 16; i++) {
				key += ch++;
			}
			return key.substring(0, 16).getBytes();
			
		}

		public static String encrypt(String plain, String key) {
			byte[] ciperMsg = new byte[1024];
			try {
				Key genkey = new SecretKeySpec(makeKey(key),"AES");
				AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);

				cipher.init(Cipher.ENCRYPT_MODE, genkey, paramSpec); 
				ciperMsg = cipher.doFinal(paddingString(plain).getBytes());
			}catch(Exception e) {
				System.out.println("");
				e.printStackTrace();
			}
			return byteToHex(ciperMsg).trim();
		}

		private static String paddingString(String plain) {
			char paddingChar = ' ';
			int size = 16;
			int x = plain.length() % size;
			int len = size - x;
			for(int i = 0; i < len ; i++)
				plain += paddingChar; 
			return plain;
		}
		public static String byteToHex(byte[] ciperMsg) {
			if(ciperMsg == null) return null;
			int len = ciperMsg.length;
			String str ="";
			for(int i=0; i < len ; i++) {
				// 
				if((ciperMsg[i]&0xFF) < 16)
					str += "0" + Integer.toHexString(ciperMsg[i]&0xFF);
				else
					str += Integer.toHexString(ciperMsg[i]&0xFF);
			}
			return str;
		}

		public static String decrypt(String ciper1, String key) {
			byte[] plainMsg = new byte[1024];
			try {
				Key genkey = new SecretKeySpec(makeKey(key), "AES");
				AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);

				cipher.init(Cipher.DECRYPT_MODE, genkey, paramSpec);
				plainMsg = cipher.doFinal(hexToByte(ciper1.trim()));
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("");
			}
			return new String(plainMsg).trim();
		}
		private static byte[] hexToByte(String str) {
			if (str == null) return null;
			if (str.length() < 2) return null;
			int len = str.length() /2;
			byte[] buffer = new byte[len];
			for(int i = 0; i < len; i++) {
				buffer[i] = (byte)Integer.parseInt(str.substring(i*2, i*2+2),16);
			}
			return buffer;
		}	
	}
