package kr.co.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SampleAdvice {
	
	// join point 설정
	// MessageService란 이름을 갖고있는 모든 service의 메서드에 적용
/*	@Before("execution(* kr.co.service.MessageService*.*(..))")
	public void startLog(JoinPoint jp) {
		System.out.println("---------------------------");
		System.out.println(Arrays.toString(jp.getArgs()));
      	System.out.println(jp.getKind());
      	System.out.println(jp.getTarget());
		System.out.println("--------시작합니다--------");
		System.out.println("---------------------------");
	}

	@After("execution(* kr.co.service.MessageService*.*(..))")
	public void endLog() {
		System.out.println("---------------------------");
		System.out.println("--------끝났습니다--------");
		System.out.println("---------------------------");
	}*/
	
	// Around 만들때 주의점
	//   1. 반환형 무조건 Object
	//   2. 반드시 throws의 Throwable을 날려야함. exception의 부모이기 때문.
	//   3. 파라미터 타입은 무조건 ProceedingJoinPoint 사용
	@Around("execution(* kr.co.service.MessageService*.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
		long start= System.currentTimeMillis();
		
		// 이 코드를 기점으로 위가 Before
		Object result= pjp.proceed(); //Around에서 꼭 사용하기.
		// 이 코드를 기점으로 아래가 After
		
		long end= System.currentTimeMillis();
		
		// 실행되는게 얼마나 걸렸는지 확인.
		System.out.println(end-start);
		System.out.println("-------------");
		
		return result;
	}

}
