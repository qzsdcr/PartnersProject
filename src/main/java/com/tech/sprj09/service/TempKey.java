package com.tech.sprj09.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class TempKey {
	public static String generateTempKey() throws NoSuchAlgorithmException {
		Random random = new Random();
		int tempKey = random.nextInt(899999) + 100000; // 100000부터 999999까지의 난수 생성

		// SHA-256 해시 함수 적용
		MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
		byte[] tempKeyBytes = String.valueOf(tempKey).getBytes();
		byte[] tempKeyHashBytes = messageDigest.digest(tempKeyBytes);

		// 해시 값에서 6자리 추출
		String tempKeyHashString = bytesToHex(tempKeyHashBytes);
		String tempKeyEncrypted = tempKeyHashString.substring(0, 6);

		return tempKeyEncrypted;
	}

	private static final char[] HEX_ARRAY = "0123456789ABCDEF".toCharArray();

	private static String bytesToHex(byte[] bytes) {
		char[] hexChars = new char[bytes.length * 2];
		for (int i = 0; i < bytes.length; i++) {
			int v = bytes[i] & 0xFF;
			hexChars[i * 2] = HEX_ARRAY[v >>> 4];
			hexChars[i * 2 + 1] = HEX_ARRAY[v & 0x0F];
		}
		return new String(hexChars);
	}
}