package com.abanate.com.util;

import java.io.Serializable;
import java.util.Locale;

import org.hibernate.boot.model.naming.Identifier;
import org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl;
import org.hibernate.engine.jdbc.env.spi.JdbcEnvironment;

/**
 * 참고 : https://codeday.me/ko/qa/20190330/177726.html
 * 
 * 자바 카멜 표기법을 테이블의 언더스코어 표기법으로 매핑을 위해 Hibernate5 부터는 아래를 사용
 * <prop key="hibernate.physical_naming_strategy">com.abanate.com.util.PhysicalNamingStrategyImpl</prop>
 * 
 * 이전 버전에서 유효하던 PhysicalNamingStrategy는 안 되어서 직접 구현, 인터넷 검색시에도 구현밖엔 답이 없는 듯
 * 아래는 이전 버전에서만 유효하던 설정
 * <prop key="hibernate.ejb.naming_strategy">org.hibernate.cfg.ImprovedNamingStrategy</prop>
 */
public class PhysicalNamingStrategyImpl extends PhysicalNamingStrategyStandardImpl implements Serializable {

 public static final PhysicalNamingStrategyImpl INSTANCE = new PhysicalNamingStrategyImpl();

 @Override
 public Identifier toPhysicalTableName(Identifier name, JdbcEnvironment context) {
     return new Identifier(addUnderscores(name.getText()), name.isQuoted());
 }

 @Override
 public Identifier toPhysicalColumnName(Identifier name, JdbcEnvironment context) {
     return new Identifier(addUnderscores(name.getText()), name.isQuoted());
 }


 protected static String addUnderscores(String name) {
     final StringBuilder buf = new StringBuilder( name.replace('.', '_') );
     for (int i=1; i<buf.length()-1; i++) {
        if (
             Character.isLowerCase( buf.charAt(i-1) ) &&
             Character.isUpperCase( buf.charAt(i) ) &&
             Character.isLowerCase( buf.charAt(i+1) )
         ) {
             buf.insert(i++, '_');
         }
     }
     return buf.toString().toLowerCase(Locale.ROOT);
 }
}