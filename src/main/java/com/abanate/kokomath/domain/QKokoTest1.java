package com.abanate.kokomath.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QKokoTest1 is a Querydsl query type for KokoTest1
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QKokoTest1 extends EntityPathBase<KokoTest1> {

    private static final long serialVersionUID = 228514484L;

    public static final QKokoTest1 kokoTest1 = new QKokoTest1("kokoTest1");

    public final StringPath test1 = createString("test1");

    public QKokoTest1(String variable) {
        super(KokoTest1.class, forVariable(variable));
    }

    public QKokoTest1(Path<? extends KokoTest1> path) {
        super(path.getType(), path.getMetadata());
    }

    public QKokoTest1(PathMetadata metadata) {
        super(KokoTest1.class, metadata);
    }

}

