package com.abanate.com.util;

import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 보안 관련 유틸
 */
public class SecureUtil {
	
	/**
     * SHA-256으로 해싱하는 메소드
     * 
     * @param bytes
     * @return
     * @throws NoSuchAlgorithmException 
     */
	public static String sha256(String msg) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        
        byte[] bSalt = "salt_secure_util".getBytes();
        byte[] bMsg  = msg.getBytes();
        
        byte[] bSaltedMsg = ByteBuffer.allocate(bSalt.length + bMsg.length).put(bSalt).put(bMsg).array();
        
        // salt 추가, kokomath 기존 비밀번호(mysql)은 md.update( msg.getBytes() ) 해 줘야 함
        md.update( bSaltedMsg );
        
        return bytesToHex(md.digest());
    }
 
    /**
     * 바이트를 헥스값으로 변환한다
     * 
     * @param bytes
     * @return
     */
    private static String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b: bytes) {
          builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }
	
}