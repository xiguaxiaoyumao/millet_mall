package com.service;

import com.mapper.AddressMapper;
import com.pojo.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zht
 * @date 2020/12/7 21:22
 */
@Service
public class AddressService {
    @Autowired
    private AddressMapper addressMapper;

    public List<Address> selectByActId(Address address) {
        return addressMapper.selectByActId(address);
    }

    public int updateAddressById(Address address) {
        return addressMapper.updateAddressById(address);
    }

    public Address selectByAddressId(Address address) {
        return addressMapper.selectByAddressId(address);
    }

    public int insertAddress(Address address) {
        return addressMapper.insertAddress(address);
    }
}
