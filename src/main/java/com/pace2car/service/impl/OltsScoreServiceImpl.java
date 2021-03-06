package com.pace2car.service.impl;

import com.pace2car.entity.OltsScore;
import com.pace2car.mapper.OltsScoreMapper;
import com.pace2car.service.IOltsScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/11 20:56
 */
@Service("oltsScoreService")
public class OltsScoreServiceImpl implements IOltsScoreService {

    @Autowired(required = false)
    private OltsScoreMapper oltsScoreMapper;

    @Override
    public List<OltsScore> selectAllScore() {
        return oltsScoreMapper.selectAllScore();
    }

    @Override
    public int updateScore(OltsScore oltsScore) {
        return oltsScoreMapper.updateScore(oltsScore);
    }

    @Override
    public int insertScore(OltsScore oltsScore) {
        return oltsScoreMapper.insertScore(oltsScore);
    }
}
