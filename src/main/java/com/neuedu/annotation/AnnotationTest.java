package com.neuedu.annotation;

import java.lang.reflect.Field;

public class AnnotationTest {

    public static void main(String[] args) {

        //UserInfo 转成sql语句
        try {
            //获取类的实例
            Class c=Class.forName("com.neuedu.pojo.UserInfo");

            //判断类上是否有Table注解
            boolean isexistsTableAnnotation=c.isAnnotationPresent(Table.class);

            if(isexistsTableAnnotation){
                //获取注解的实例
                Table table=(Table) c.getAnnotation(Table.class);
                System.out.println(table.value());
            }
            Field[] fields=c.getFields();
            for(Field field:fields){
                boolean iscolumnAnotation=field.isAnnotationPresent(Column.class);
                if(iscolumnAnotation){
                    Column annotation=(Column) field.getAnnotation(Column.class);
                    System.out.println(annotation.value());
                }
            }



        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
