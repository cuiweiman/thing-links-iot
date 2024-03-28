package com.cs.modules.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cs.api.system.domain.SysDept;

import java.util.List;

/**
 * @description:
 * @author: cuiweiman
 * @date: 2024/3/27 23:08
 */
public interface SysDeptMapper extends BaseMapper<SysDept> {

    List<SysDept> selectDeptList(SysDept sysDept);

}
