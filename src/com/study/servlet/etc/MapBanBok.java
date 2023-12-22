package com.study.servlet.etc;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class MapBanBok {
    public static void main(String[] args) {

        //Set LIST는 for문 가능. SET은 iterator도 가능
        Map<String, String> map = new HashMap<>();
        map.put("1번멤버", "김민지");
        map.put("2번멤버", "팜하니");
        map.put("3번멤버", "다니엘");
        map.put("4번멤버", "강해린");
        map.put("5번멤버", "이혜인");

        // map은 반복x, set을 반복하는 거임
        Set<String> keySet = map.keySet();
        for(String key : keySet){
            System.out.println(key + " : " + map.get(key));
        }

        Iterator<String> keyIterator = keySet.iterator();
        while ( keyIterator.hasNext()){
            String key = keyIterator.next();
            System.out.println(key + " : " + map.get(key));
        }

        Set<Map.Entry<String, String>> entries =  map.entrySet();

        for(Map.Entry<String, String> entry : entries){
            System.out.println(entry.getKey() + " : " + entry.getValue());
        }




    }
}
