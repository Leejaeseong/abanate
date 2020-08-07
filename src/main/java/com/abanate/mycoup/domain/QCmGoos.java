package com.abanate.mycoup.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QCmGoos is a Querydsl query type for CmGoos
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QCmGoos extends EntityPathBase<CmGoos> {

    private static final long serialVersionUID = 1194551068L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QCmGoos cmGoos = new QCmGoos("cmGoos");

    public final com.abanate.com.domain.QComSuffixDomain _super = new com.abanate.com.domain.QComSuffixDomain(this);

    public final NumberPath<Long> cmGoosSeq = createNumber("cmGoosSeq", Long.class);

    public final QCmStor cmStor;

    public final StringPath goosNm = createString("goosNm");

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

    public final NumberPath<Long> savAmt = createNumber("savAmt", Long.class);

    //inherited
    public final DateTimePath<java.util.Date> updDttm = _super.updDttm;

    //inherited
    public final StringPath updPgmId = _super.updPgmId;

    //inherited
    public final StringPath updUsrIp = _super.updUsrIp;

    //inherited
    public final NumberPath<Long> updUsrSeq = _super.updUsrSeq;

    public QCmGoos(String variable) {
        this(CmGoos.class, forVariable(variable), INITS);
    }

    public QCmGoos(Path<? extends CmGoos> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QCmGoos(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QCmGoos(PathMetadata metadata, PathInits inits) {
        this(CmGoos.class, metadata, inits);
    }

    public QCmGoos(Class<? extends CmGoos> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.cmStor = inits.isInitialized("cmStor") ? new QCmStor(forProperty("cmStor")) : null;
    }

}

