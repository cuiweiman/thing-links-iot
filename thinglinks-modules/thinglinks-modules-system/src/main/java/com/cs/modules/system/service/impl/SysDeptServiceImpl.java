package com.cs.modules.system.service.impl;

import com.cs.api.system.domain.SysDept;
import com.cs.modules.system.domain.vo.TreeSelect;
import com.cs.modules.system.mapper.SysDeptMapper;
import com.cs.modules.system.mapper.SysRoleMapper;
import com.cs.modules.system.service.ISysDeptService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description: 部门管理 服务实现
 * @author: cuiweiman
 * @date: 2024/3/28 11:39
 */
@Service
@RequiredArgsConstructor(onConstructor_ = {@Autowired})
public class SysDeptServiceImpl implements ISysDeptService {

    private final SysDeptMapper deptMapper;
    private final SysRoleMapper roleMapper;

    @Override
    public List<SysDept> selectDeptList(SysDept dept) {
        return deptMapper.selectDeptList(dept);
    }

    @Override
    public List<SysDept> buildDeptTree(List<SysDept> depts) {
        return null;
    }

    @Override
    public List<TreeSelect> buildDeptTreeSelect(List<SysDept> depts) {
        return null;
    }
}
