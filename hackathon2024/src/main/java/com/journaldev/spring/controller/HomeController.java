package com.journaldev.spring.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ThreadLocalRandom;

import org.example.SavingsCalculator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.model.AccountDetails;
import com.journaldev.spring.model.Payments;
import com.journaldev.spring.model.User;

@Controller
public class HomeController {
	public static String fromAccountNumber;
	public static String acntNumber;
	public static String invAcntNumber;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("Home Page Requested, locale = " + locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index";
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String user(@Validated User user, Model model) {
		System.out.println("User Page Requested");
		SavingsCalculator s=new SavingsCalculator();
		model.addAttribute("timet",user.getTimet());
		model.addAttribute("amount",user.getAmount());
		model.addAttribute("userName",user.getUserName());
		List <String> a=s.getList(user);
		model.addAttribute("one",s.getList(user).get(0));
		model.addAttribute("two",s.getList(user).get(1));
		model.addAttribute("three",s.getList(user).get(2));
		model.addAttribute("four",s.getList(user).get(3));
		model.addAttribute("five",s.getList(user).get(4));
		model.addAttribute("six",s.getList(user).get(5));
		model.addAttribute("seven",s.getList(user).get(6));
		return "user";
	}
	@RequestMapping(value="/selectpaymenttype", method = RequestMethod.POST)
	public ModelAndView selectPaymentType(String acntNumber, String invAcntNumber) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(acntNumber);
		System.out.println(fromAccountNumber);
		this.acntNumber=acntNumber;
		this.invAcntNumber=invAcntNumber;
		modelAndView.addObject("fromAccount",fromAccountNumber);
		modelAndView.addObject("acntNumber",acntNumber);
		modelAndView.addObject("invAcntNumber",invAcntNumber);
		modelAndView.setViewName("selectPaymentType");
		return modelAndView;
	}
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String Login(@ModelAttribute User userdetails,Model model) {
		
		model.addAttribute("userName",userdetails.getUserName());
		return "home";
	}
	@RequestMapping(value="/selectaccount", method = RequestMethod.POST)
	public ModelAndView Home(@RequestBody String request,@RequestBody String te) {
  List<AccountDetails> accountList =new ArrayList<>();
  AccountDetails accountList1=new AccountDetails();
  fromAccountNumber = request;
  accountList1.accountId="47567843939955";
  accountList1.accountType="saving";
  accountList1.balance="100";
  accountList1.nickname="saving";
  AccountDetails accountList2=new AccountDetails();
  accountList2.accountId="45454545454545";
  accountList2.accountType="saving";
  accountList2.balance="100";
  accountList2.nickname="saving";
  AccountDetails accountList3=new AccountDetails();
  accountList3.accountId="344434234234234";
  accountList3.accountType="investment";
  accountList3.balance="10";
  accountList3.nickname="investment";
  accountList.add(accountList1);
  accountList.add(accountList2);
  accountList.add(accountList3);
  ModelAndView modelAndView = new ModelAndView();
		 modelAndView.addObject("accountList",accountList);
		  modelAndView.addObject("accountListSize",accountList.size());
		//modelAndView.addObject("login","jhjhg");
		modelAndView.setViewName("selectaccount");
		System.out.println(request);
		System.out.println("inside select account controller");
		
		return modelAndView;
	}
	@RequestMapping(value="/makepayment", method = RequestMethod.POST)
	public ModelAndView makePayment(String request) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(request);
		System.out.println(fromAccountNumber);
		modelAndView.addObject("fromAccount",acntNumber);
		modelAndView.addObject("invAcntNumber",invAcntNumber);
		modelAndView.addObject("payAnalytics",fromAccountNumber);
		modelAndView.addObject("charity1","asdasd");
		
		modelAndView.setViewName("paymentsetupscreen");
		return modelAndView;
	}
	@RequestMapping(value="/submitpayment", method = RequestMethod.POST)
	public ModelAndView submitPayment(@ModelAttribute Payments payment) {
		ModelAndView modelAndView = new ModelAndView();
		payment.setPaymentId(ThreadLocalRandom.current().nextInt());
		payment.setPaymentType("FP");
		System.out.println(payment.getToAccount());
		//String view = paymentService.createPayment(payment);
		modelAndView.setViewName("submitted");
		return modelAndView;
	}
}
