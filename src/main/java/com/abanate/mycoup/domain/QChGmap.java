package com.abanate.mycoup.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QChGmap is a Querydsl query type for ChGmap
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QChGmap extends EntityPathBase<ChGmap> {

    private static final long serialVersionUID = 1189931104L;

    public static final QChGmap chGmap = new QChGmap("chGmap");

    public final com.abanate.com.domain.QComSuffixDomain _super = new com.abanate.com.domain.QComSuffixDomain(this);

    public final NumberPath<Long> chGmapSeq = createNumber("chGmapSeq", Long.class);

    public final NumberPath<Long> loadCnt = createNumber("loadCnt", Long.class);

    public final StringPath mgrDt = createString("mgrDt");

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

    public QChGmap(String variable) {
        super(ChGmap.class, forVariable(variable));
    }

    public QChGmap(Path<? extends ChGmap> path) {
        super(path.getType(), path.getMetadata());
    }

    public QChGmap(PathMetadata metadata) {
        super(ChGmap.class, metadata);
    }

}

