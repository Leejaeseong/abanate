package com.abanate.mycoup.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QCmNatiCd is a Querydsl query type for CmNatiCd
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QCmNatiCd extends EntityPathBase<CmNatiCd> {

    private static final long serialVersionUID = 1394924601L;

    public static final QCmNatiCd cmNatiCd = new QCmNatiCd("cmNatiCd");

    public final com.abanate.com.domain.QComSuffixDomain _super = new com.abanate.com.domain.QComSuffixDomain(this);

    public final NumberPath<Long> cmNatiCdSeq = createNumber("cmNatiCdSeq", Long.class);

    public final StringPath natiCd = createString("natiCd");

    public final StringPath natiNmEng = createString("natiNmEng");

    public final StringPath natiNmKor = createString("natiNmKor");

    //inherited
    public final DateTimePath<java.util.Date> regDttm = _super.regDttm;

    //inherited
    public final StringPath regPgmId = _super.regPgmId;

    //inherited
    public final StringPath regUsrIp = _super.regUsrIp;

    //inherited
    public final NumberPath<Long> regUsrSeq = _super.regUsrSeq;

    //inherited
    public final StringPath rmks = _super.rmks;

    //inherited
    public final DateTimePath<java.util.Date> updDttm = _super.updDttm;

    //inherited
    public final StringPath updPgmId = _super.updPgmId;

    //inherited
    public final StringPath updUsrIp = _super.updUsrIp;

    //inherited
    public final NumberPath<Long> updUsrSeq = _super.updUsrSeq;

    public QCmNatiCd(String variable) {
        super(CmNatiCd.class, forVariable(variable));
    }

    public QCmNatiCd(Path<? extends CmNatiCd> path) {
        super(path.getType(), path.getMetadata());
    }

    public QCmNatiCd(PathMetadata metadata) {
        super(CmNatiCd.class, metadata);
    }

}

