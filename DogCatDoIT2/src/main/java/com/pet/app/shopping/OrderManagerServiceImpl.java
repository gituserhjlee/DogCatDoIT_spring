package com.pet.app.shopping;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;

@Service("shopoping.orderManagerService")
public class OrderManagerServiceImpl implements OrderManagerService {
    @Autowired
    private CommonDAO dao;

    @Override
    public int orderCount(Map<String, Object> paramMap) {
        int result = 0;
        try {
            result = dao.selectOne("orderManager.dataCount", paramMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public List<Order> listOrder(Map<String, Object> paramMap) {
        List<Order> listOrder = null;
        try {
            listOrder = dao.selectList("orderManager.listOrder", paramMap);
            for (Order dto : listOrder) {
                dto.setStateName(OrderStateCode.codeToState(dto.getState()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listOrder;
    }

    @Override
    public Order readOrder(long orderIdx) {
        Order order = null;
        try {
            order = dao.selectOne("orderManager.readOrder", orderIdx);
            List<OrderDetail> itemList = dao.selectList("orderManager.listOrderDetail", orderIdx);
            order.setItemList(itemList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public String updateState(Map<String, Object> paramMap) throws Exception {
        String stateName = "";
        try {
            dao.updateData("orderManager.updateState", paramMap);

            int state = (int) paramMap.get("state");
            stateName = OrderStateCode.codeToState(state);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return stateName;
    }

}
