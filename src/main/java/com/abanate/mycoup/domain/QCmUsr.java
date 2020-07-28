package com.abanate.mycoup.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QCmUsr is a Querydsl query type for CmUsr
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QCmUsr extends EntityPathBase<CmUsr> {

    private static final long serialVersionUID = 1424020804L;

    public static final QCmUsr cmUsr = new QCmUsr("cmUsr");

    public final com.abanate.com.domain.QComSuffixDomain _super = new com.abanate.com.domain.QComSuffixDomain(this);

    public final NumberPath<Long> cmUsrSeq = createNumber("cmUsrSeq", Long.class);

    public final StringPath email = createString("email");

    public final StringPath joinYn = createString("joinYn");

    public final StringPath marketAgreeYn = createString("marketAgreeYn");

    public final StringPath natiCd = createString("natiCd");

    public final StringPath passwd = createString("passwd");

    public final StringPath passwdChngToken = createString("passwdChngToken");

    //inherited
    public final DateTimePath<java.util.Date> regDttm = _super.regDttm;

    //inherited
    public final StringPath regPgmId = _super.regPgmId;

    //inherited
    public final StringPath regUsrId = _super.regUsrId;

    //inherited
    public final StringPath regUsrIp = _super.regUsrIp;

    //inherited
    public final StringPath rmks = _super.rmks;

    //inherited
    public final DateTimePath<java.util.Date> updDttm = _super.updDttm;

    //inherited
    public final StringPath updPgmId = _super.updPgmId;

    //inherited
    public final StringPath updUsrId = _super.updUsrId;

    //inherited
    public final StringPath updUsrIp = _super.updUsrIp;

    public final StringPath usrId = createString("usrId");

    public final StringPath usrNm = createString("usrNm");

    public final StringPath usrTp = createString("usrTp");

    public QCmUsr(String variable) {
        super(CmUsr.class, forVariable(variable));
    }

    public QCmUsr(Path<? extends CmUsr> path) {
        super(path.getType(), path.getMetadata());
    }

    public QCmUsr(PathMetadata metadata) {
        super(CmUsr.class, metadata);
    }

}

