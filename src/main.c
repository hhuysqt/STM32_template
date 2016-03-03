#include <stm32f10x.h>
#include <stm32f10x_rcc.h>
#include <stm32f10x_gpio.h>
#include <stm32f10x_tim.h>

#define LED_PIN GPIO_Pin_6
#define LED_ON GPIO_ResetBits(GPIOF, LED_PIN);
#define LED_OFF GPIO_SetBits(GPIOF, LED_PIN);

void InitWorld(void)
{
	TIM_TimeBaseInitTypeDef tim2_base;

	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
	
	TIM_DeInit(TIM2);
	tim2_base.TIM_Prescaler = 71;
	tim2_base.TIM_CounterMode = TIM_CounterMode_Up;
	tim2_base.TIM_ClockDivision = 0;
	tim2_base.TIM_Period = 1000; 
	TIM_TimeBaseInit(TIM2, &tim2_base);
	TIM_Cmd(TIM2, ENABLE);
}

void delay_ms(u16 n)
{
	while(n--)
	{
		while(TIM_GetFlagStatus(TIM2, TIM_FLAG_Update) != SET);
		TIM_ClearFlag(TIM2, TIM_FLAG_Update);
	}
}

int main()
{
	InitWorld();

	{
		GPIO_InitTypeDef LEDIO;
		
		RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOF, ENABLE);
		
		LEDIO.GPIO_Mode = GPIO_Mode_Out_PP;
		LEDIO.GPIO_Speed = GPIO_Speed_50MHz;
		LEDIO.GPIO_Pin = LED_PIN;
		
		GPIO_Init(GPIOF, &LEDIO);
	}

	while(1)
	{
		delay_ms(500);
		LED_ON;
		delay_ms(500);
		LED_OFF;
	}
	
	return 0;
}
