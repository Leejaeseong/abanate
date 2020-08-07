package com.abanate.mycoup.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QChVisit is a Querydsl query type for ChVisit
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QChVisit extends EntityPathBase<ChVisit> {

    private static final long serialVersionUID = -1753090592L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QChVisit chVisit = new QChVisit("chVisit");

    public final com.abanate.com.domain.QComSuffixDomain _super = new com.abanate.com.domain.QComSuffixDomain(this);

    public final NumberPath<Long> accumAmt = createNumber("accumAmt", Long.class);

    public final NumberPath<Long> chVisitSeq = createNumber("chVisitSeq", Long.class);

    public final QCmStor cmStor;

    public final QCmUsr cmUsr;

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

    public final NumberPath<Long> useAmt = createNumber("useAmt", Long.class);

    public final StringPath useTp = createString("useTp");

    public final StringPath visitDtm = createString("visitDtm");

    public QChVisit(String variable) {
        this(ChVisit.class, forVariable(variable), INITS);
    }

    public QChVisit(Path<? extends ChVisit> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QChVisit(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QChVisit(PathMetadata metadata, PathInits inits) {
        this(ChVisit.class, metadata, inits);
    }

    public QChVisit(Class<? extends ChVisit> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.cmStor = inits.isInitialized("cmStor") ? new QCmStor(forProperty("cmStor")) : null;
        this.cmUsr = inits.isInitialized("cmUsr") ? new QCmUsr(forProperty("cmUsr")) : null;
    }

}

