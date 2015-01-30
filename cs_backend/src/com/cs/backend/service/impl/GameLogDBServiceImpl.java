package com.cs.backend.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cs.backend.db.dao.GameLogDBMapper;
import com.cs.backend.db.model.GameLogDB;
import com.cs.backend.service.GameLogDBService;

@Component
public class GameLogDBServiceImpl implements GameLogDBService {
	
	@Resource
	private GameLogDBMapper dbMapper ;
	
	public List<GameLogDB> selectGameLogDBBySid(int sid) {
		return dbMapper.selectGameLogDBBySid(sid) ;
	}

}
