package com.how2java.tmall.mapper;

import com.how2java.tmall.pojo.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryMapper {
    /**
     * 倒序查询category表
     *
     * @return 结果集：多条记录list
     */
    List<Category> list();
}
