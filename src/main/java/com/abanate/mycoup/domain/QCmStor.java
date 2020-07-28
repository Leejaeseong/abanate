package com.abanate.mycoup.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QCmStor is a Querydsl query type for CmStor
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QCmStor extends EntityPathBase<CmStor> {

    private static final long serialVersionUID = 1194913364L;

    public static final QCmStor cmStor = new QCmStor("cmStor");

    public final com.abanate.com.domain.QComSuffixDomain _super = new com.abanate.com.domain.QComSuffixDomain(this);

    public final StringPath addrDtl = createString("addrDtl");

    public final StringPath addrPt1 = createString("addrPt1");

    public final StringPath addrPt2 = createString("addrPt2");

    public final NumberPath<Long> cmStorSeq = createNumber("cmStorSeq", Long.class);

    public final StringPath mapLat = createString("mapLat");

    public final StringPath mapLng = createString("mapLng");

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

    public final NumberPath<Long> savAmt = createNumber("savAmt", Long.class);

    public final NumberPath<Long> savLimitAmt = createNumber("savLimitAmt", Long.class);

    public final StringPath savTp = createString("savTp");

    public final StringPath storId = createString("storId");

    public final StringPath storNm = createString("storNm");

    public final StringPath telNo = createString("telNo");

    //inherited
    public final DateTimePath<java.util.Date> updDttm = _super.updDttm;

    //inherited
    public final StringPath updPgmId = _super.updPgmId;

    //inherited
    public final StringPath updUsrId = _super.updUsrId;

    //inherited
    public final StringPath updUsrIp = _super.updUsrIp;

    public final NumberPath<Long> useAmt = createNumber("useAmt", Long.class);

    public final StringPath zipCd = createString("zipCd");

    public QCmStor(String variable) {
        super(CmStor.class, forVariable(variable));
    }

    public QCmStor(Path<? extends CmStor> path) {
        super(path.getType(), path.getMetadata());
    }

    public QCmStor(PathMetadata metadata) {
        super(CmStor.class, metadata);
    }

}

