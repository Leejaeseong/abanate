package com.abanate.kokomath.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QKokoMemberMgr is a Querydsl query type for KokoMemberMgr
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QKokoMemberMgr extends EntityPathBase<KokoMemberMgr> {

    private static final long serialVersionUID = -1314881677L;

    public static final QKokoMemberMgr kokoMemberMgr = new QKokoMemberMgr("kokoMemberMgr");

    public final com.abanate.com.domain.QComSuffixDomain _super = new com.abanate.com.domain.QComSuffixDomain(this);

    public final StringPath addr = createString("addr");

    public final StringPath emailAddr = createString("emailAddr");

    public final StringPath grade = createString("grade");

    public final StringPath msg = createString("msg");

    public final StringPath passwd = createString("passwd");

    //inherited
    public final DateTimePath<java.util.Date> regDttm = _super.regDttm;

    //inherited
    public final StringPath regPgmId = _super.regPgmId;

    //inherited
    public final StringPath regUsrId = _super.regUsrId;

    //inherited
    public final StringPath regUsrIp = _super.regUsrIp;

    public final StringPath remk = createString("remk");

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

    public final StringPath usrNm = createString("usrNm");

    public QKokoMemberMgr(String variable) {
        super(KokoMemberMgr.class, forVariable(variable));
    }

    public QKokoMemberMgr(Path<? extends KokoMemberMgr> path) {
        super(path.getType(), path.getMetadata());
    }

    public QKokoMemberMgr(PathMetadata metadata) {
        super(KokoMemberMgr.class, metadata);
    }

}

