package com.abanate.kokomath.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QKokoVisitLog is a Querydsl query type for KokoVisitLog
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QKokoVisitLog extends EntityPathBase<KokoVisitLog> {

    private static final long serialVersionUID = -1410556668L;

    public static final QKokoVisitLog kokoVisitLog = new QKokoVisitLog("kokoVisitLog");

    public final com.abanate.com.domain.QComSuffixDomain _super = new com.abanate.com.domain.QComSuffixDomain(this);

    //inherited
    public final DateTimePath<java.util.Date> regDttm = _super.regDttm;

    //inherited
    public final StringPath regPgmId = _super.regPgmId;

    //inherited
    public final StringPath regUsrId = _super.regUsrId;

    //inherited
    public final StringPath regUsrIp = _super.regUsrIp;

    public final NumberPath<Long> seq = createNumber("seq", Long.class);

    //inherited
    public final DateTimePath<java.util.Date> updDttm = _super.updDttm;

    //inherited
    public final StringPath updPgmId = _super.updPgmId;

    //inherited
    public final StringPath updUsrId = _super.updUsrId;

    //inherited
    public final StringPath updUsrIp = _super.updUsrIp;

    public final StringPath usrId = createString("usrId");

    public final StringPath usrIp = createString("usrIp");

    public final StringPath visitDtm = createString("visitDtm");

    public final StringPath visitPage = createString("visitPage");

    public QKokoVisitLog(String variable) {
        super(KokoVisitLog.class, forVariable(variable));
    }

    public QKokoVisitLog(Path<? extends KokoVisitLog> path) {
        super(path.getType(), path.getMetadata());
    }

    public QKokoVisitLog(PathMetadata metadata) {
        super(KokoVisitLog.class, metadata);
    }

}

