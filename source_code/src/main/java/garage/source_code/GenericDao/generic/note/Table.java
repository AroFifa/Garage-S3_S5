package garage.source_code.GenericDao.generic.note;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface Table {
    String tableName() default "";

    String sgbd() default "postgresql";

    String database() default "garage1";

    String user() default "postgres";

    String password() default "0000";
}
