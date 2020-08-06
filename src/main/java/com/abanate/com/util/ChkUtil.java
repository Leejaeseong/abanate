package com.abanate.com.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Parameter;
import javax.persistence.Query;

import com.querydsl.core.QueryMetadata;
import com.querydsl.core.Tuple;
import com.querydsl.core.support.NumberConversions;
import com.querydsl.core.types.Expression;
import com.querydsl.core.types.QTuple;
import com.querydsl.core.types.dsl.NumberOperation;
import com.querydsl.core.types.dsl.StringOperation;
import com.querydsl.jpa.JPQLQuery;

/**
 * Utilities about check variables and about more convenient functions.
 * 
 */
public class ChkUtil {
	
	/**
	 * Check whether this object is null
	 * @param obj
	 * @return true  : is not null
	 *         false : is null
	 */
	public static boolean chkNull( Object obj ) {
		if( obj == null ) return false;
		else			  return true;
	}
	
	/**
	 * Check if this character is null or empty
	 * @param obj
	 * @return true  : is not null and empty
	 *         false : is null or empty
	 */
	public static boolean chkNull( String str ) {
		if( str == null || "".equals( str.trim() ) ) 	return false;
		else			  								return true;
	}
	
	/**
	 * Check if pass recaptcha validation
	 * @param map
	 * @return
	 */
	public static boolean chkPassRecaptcha( Map<String, Object> map ) {
		if( map.get( "success" ) != null 
				&& (Boolean)map.get( "success" ) == true 
				&& map.get( "score" ) != null 
				&& ChkUtil.toZeroByDouble( map.get( "score" ) ) >= ConstUtil.RECAPTCHA_SUCC_SCORE ) {
			return true;
		} else {
			return false;
		}			
	}
	
	/**
	 * Convert to zero, if parameter is null
	 * @param obj
	 * @return
	 */
	public static double toZeroByDouble( Object obj ) {
		if( obj == null ) return 0;
		return (double)obj;		
	}
	
	/**
	 * Convert to zero, if parameter is null
	 * @param obj
	 * @return
	 */
	public static float toZeroByFloat( Object obj ) {
		if( obj == null ) return 0f;
		return (float)obj;		
	}
	
	/**
	 * Convert to zero, if parameter is null
	 * @param obj
	 * @return
	 */
	public static long toZeroByLong( Object obj ) {
		if( obj == null ) return 0L;
		return (Long)obj;		
	}
	
	/**
	 * Convert to integer type, For paging.
	 * @param obj
	 * @return int
	 */
	public static int toIntPaging( Object obj ) {
		String str; 
		
		if( obj == null ) {
			return ConstUtil.FIRST_PAGE;
		} else if( obj instanceof String ) {// remove below decimal point
			if( obj.equals( "" ) ) return 0;
			str = obj.toString();
			return Integer.parseInt( ChkUtil.removeBelowDecimalPoint( str ) );			
		} else if( obj instanceof Float ) {	// remove below decimal point
			str = String.valueOf( (Float)obj );
			return Integer.parseInt( ChkUtil.removeBelowDecimalPoint( str ) );
		} else if( obj instanceof Double ) {	// remove below decimal point
			str = String.valueOf( (Double)obj );
			return Integer.parseInt( ChkUtil.removeBelowDecimalPoint( str ) );			
		} else {
			return (int)obj;
		}
		
	}
	
	/**
	 * Convert to long type. For sequence from json protocol and serialized in double.
	 * @param obj	e.g. sequence id
	 * @return long	long type. if null then return 0L	
	 */
	public static Long toLong( Object obj ) {
		String str; 
		
		if( obj instanceof String ) {// remove below decimal point
			if( obj.equals( "" ) ) return 0L;
			str = obj.toString();
			return Long.parseLong( ChkUtil.removeBelowDecimalPoint( str ) );			
		} else if( obj instanceof Float ) {	// remove below decimal point
			str = String.valueOf( (Float)obj );
			return Long.parseLong( ChkUtil.removeBelowDecimalPoint( str ) );
		} else if( obj instanceof Double ) {	// remove below decimal point
			str = String.valueOf( (Double)obj );
			return Long.parseLong( ChkUtil.removeBelowDecimalPoint( str ) );			
		} else {
			return (Long)obj;
		}
		
	}
	
	/**
	 * Set parameter of native query.
	 * Prevent error from setting the parameter in none given at query.
	 * @param query
	 * @param paramNm
	 * @param paramVal
	 */
	public static void setNativeQueryParam( Query query, String paramNm, String paramVal ) {
		java.util.Iterator<Parameter<?>> iter = query.getParameters().iterator();
		while( iter.hasNext() ) {			
			if( iter.next().getName().equals( paramNm ) ) {
				query.setParameter( paramNm, paramVal );
				break;
			}
		}		
	}
	
	/**
	 * Get map include list and projection information.  
	 * @param list	: List<Tuple>
	 *        query : JPQLQuery<?>
	 * @return map 	key "data" is data = List<Tuple>.
	 * 				key "projection" is projection order map = Map<String, Integer>.
	 */
	public static Map<String, Object> getMapToListAndProjectionInfo( List<Tuple> list, JPQLQuery<?> query ) {		
		Map<String, Object>  rMap = new HashMap<String, Object>();
		Map<String, Integer> pMap = new HashMap<String, Integer>();
		
		rMap.put( "data", list );
		
		QueryMetadata meta = (query).getMetadata();
		Expression<?> proj = meta.getProjection();
		
		List<Expression<?>> ep;
		if( proj instanceof NumberConversions ) {
			NumberConversions<?> qt = (NumberConversions<?>)proj;
			ep = qt.getArgs();
		} else {
			QTuple qt = (QTuple)proj;
			ep = qt.getArgs();			
		}
		
		for( int i = 0; i < ep.size(); i++ ) {
			Object obj = ep.get( i );
			
			if ( obj instanceof StringOperation ) {
				pMap.put( ChkUtil.getVarName( ((StringOperation)obj).getArgs().get(1).toString() ), i );
			} else if( obj instanceof NumberOperation ) {
				pMap.put( ChkUtil.getVarName( ((NumberOperation<?>)obj).getArgs().get(1).toString() ), i );				
			} else {	// NumberPath, StringPath
				pMap.put( ChkUtil.getVarName( obj.toString() ), i );
			}
		}
		
		rMap.put( "projection", pMap );
		
		return rMap;
	}

	/**
	 * Remove below decimal point.
	 * @param str
	 * @return
	 */
	public static String removeBelowDecimalPoint( String str ) {
		return str.indexOf(".") == -1 ? str : str.substring(0, str.indexOf( "." ) );
	}
	
	/**
	 * Get minimum date time.
	 * This uses at the query clauses.
	 * @param dtm minimum date time String.
	 * @return If the parameter value exists, then return parameter value itself( replace from "-","." to "" and suffix time )
	 * 										, or return minimum date-time String.
	 */
	public static String getMinDtm( String dtm ) {
		if( ChkUtil.chkNull( dtm ) ) {
			dtm = dtm.replaceAll( "-", "" ).replaceAll( "\\.", "" );
			if( dtm.length() == 8 ) {
				dtm = dtm + "000000";
			}
			return dtm;
		} else {
			return ConstUtil.MIN_DTM;
		}
	}
	
	/**
	 * Get maximum date time.
	 * This uses at the query clauses.
	 * @param dtm maximum date time String.
	 * @return If the parameter value exists, then return parameter value itself( replace from "-","." to "" and suffix time )
	 * 										, or return maximum date-time String.
	 */
	public static String getMaxDtm( String dtm ) {
		if( ChkUtil.chkNull( dtm ) ) {
			dtm = dtm.replaceAll( "-", "" ).replaceAll( "\\.", "" );
			if( dtm.length() == 8 ) {
				dtm = dtm + "235959";
			}
			return dtm;
		} else {
			return DateUtil.getDateTimeStrNoMark();
		}
	}
	
	/**
	 * Get variable's name from the QueryDSL object of a Q type.
	 * @param obj
	 * @return
	 */
	public static String getVarName( Object obj ) {
		return obj.toString().substring( obj.toString().indexOf( "." ) + 1 );
	}
}