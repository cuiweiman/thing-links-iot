package com.cs.modules.system.controller;

import com.cs.api.system.domain.SysDept;
import com.cs.common.core.web.controller.BaseController;
import com.cs.modules.system.service.ISysDeptService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @description: 部门信息
 * @author: cuiweiman
 * @date: 2024/3/28 11:53
 */
@RestController
@Tag(name = "系统服务")
@RequestMapping("/dept")
@RequiredArgsConstructor(onConstructor_ = {@Autowired})
public class SysDeptController extends BaseController {

    private final ISysDeptService deptService;

    @Operation(summary = "获取部门列表")
    @Parameter(name = "SysDept", description = "搜索条件")
    @GetMapping(value = "/list", name = "获取部门列表")
    public String list(SysDept dept) {
        List<SysDept> deptList = deptService.selectDeptList(dept);
        return deptList.toString();
    }


}
