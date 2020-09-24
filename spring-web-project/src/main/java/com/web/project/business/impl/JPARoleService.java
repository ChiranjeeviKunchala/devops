package com.web.project.business.impl;

import org.springframework.stereotype.Service;

import com.web.project.business.RoleService;
import com.web.project.business.model.Role;

@Service
public class JPARoleService extends JPACRUDService<Long, Role> implements RoleService {

}
