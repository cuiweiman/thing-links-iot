package com.cs.modules.system.service;

import com.cs.api.system.domain.SysDept;
import com.cs.modules.system.domain.vo.TreeSelect;

import java.util.List;

/**
 * @description: 部门管理 服务层
 * @author: cuiweiman
 * @date: 2024/3/28 11:29
 */
public interface ISysDeptService {
    /**
     * 查询部门管理数据
     *
     * @param dept 部门信息
     * @return 部门信息集合
     */
     List<SysDept> selectDeptList(SysDept dept);

    /**
     * 构建前端所需要树结构
     *
     * @param depts 部门列表
     * @return 树结构列表
     */
     List<SysDept> buildDeptTree(List<SysDept> depts);

    /**
     * 构建前端所需要下拉树结构
     *
     * @param depts 部门列表
     * @return 下拉树结构列表
     */
     List<TreeSelect> buildDeptTreeSelect(List<SysDept> depts);

}
