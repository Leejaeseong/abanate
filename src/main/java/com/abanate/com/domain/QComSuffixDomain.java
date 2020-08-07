package com.abanate.com.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QComSuffixDomain is a Querydsl query type for ComSuffixDomain
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QComSuffixDomain extends EntityPathBase<ComSuffixDomain> {

    private static final long serialVersionUID = 946986320L;

    public static final QComSuffixDomain comSuffixDomain = new QComSuffixDomain("comSuffixDomain");

    public final DateTimePath<java.util.Date> regDttm = createDateTime("regDttm", java.util.Date.class);

    public final StringPath regPgmId = createString("regPgmId");

    public final StringPath regUsrIp = createString("regUsrIp");

    public final NumberPath<Long> regUsrSeq = createNumber("regUsrSeq", Long.class);

    public final StringPath rmks = createString("rmks");

    public final DateTimePath<java.util.Date> updDttm = createDateTime("updDttm", java.util.Date.class);

    public final StringPath updPgmId = createString("updPgmId");

    public final StringPath updUsrIp = createString("updUsrIp");

    public final NumberPath<Long> updUsrSeq = createNumber("updUsrSeq", Long.class);

    public QComSuffixDomain(String variable) {
        super(ComSuffixDomain.class, forVariable(variable));
    }

    public QComSuffixDomain(Path<? extends ComSuffixDomain> path) {
        super(path.getType(), path.getMetadata());
    }

    public QComSuffixDomain(PathMetadata metadata) {
        super(ComSuffixDomain.class, metadata);
    }

}

