package org.example;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.journaldev.spring.model.User;

class Category {
    String name;
    int transactionCount;
    double amount;

    public Category(String name, int transactionCount, double amount) {
        this.name = name;
        this.transactionCount = transactionCount;
        this.amount = amount;
    }
}

public class SavingsCalculator {
    public static Map<String, Double> calculateSavingsPerTransaction(List<Category> data, double targetSavings, int months) {
        double totalSpending = data.stream().mapToDouble(c -> c.amount).sum();
        double monthlySavings = targetSavings / months;
        double savingsPerDollar = monthlySavings / totalSpending;

        Map<String, Double> savingsPerTransaction = new LinkedHashMap<String, Double>();
        for (Category category : data) {
            double categorySavings = category.amount * savingsPerDollar;
            double d=categorySavings / category.transactionCount;
            
            savingsPerTransaction.put(category.name,(double) Math.round(d * 100) / 100 );
        }
        return savingsPerTransaction;
    }
  
    public   List<String> getList (User user){
        List<Category> data = new ArrayList<>();
        data.add(new Category("0-10", 143, 8));
        data.add(new Category("11-50", 54, 32));
        data.add(new Category("51-100", 33, 83));
        data.add(new Category("101-250", 21, 221));
        data.add(new Category("251 and above", 5, 988));

        double targetSavings = user.getAmount();
        Map<String, Double> result = new HashMap<>();
        List<String> asd=new ArrayList<>();
        String s="";
        for (int i=1;i<7;i++) {
           String a=calculateSavingsPerTransaction(data, targetSavings, i).toString();
           asd.add(a.replace("{", "").replace("}", "").replace("=", ":").replace(",", "|"));
        }
        String a=calculateSavingsPerTransaction(data, targetSavings, Integer.parseInt(user.getTimet())).toString();
        asd.add(a.replace("{", "").replace("}", "").replace("=", ":").replace(",", "|"));
        System.out.println(asd);
		return asd;
    }
}