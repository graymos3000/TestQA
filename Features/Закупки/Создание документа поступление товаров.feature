﻿#language: ru



Функционал: Создание документа Поступления товаров

Как Менеджер по закупкам я хочу
создание документа поступления товаров
чтобы поставить товар на учет

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание документа Поступления товаров
// создание документа
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	
	И В командном интерфейсе я выбираю "Закупки" "Поступления товаров"	
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* заполнение шапки	
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	Тогда элемент формы с именем "Склад" стал равен 'Малый'	
	И из выпадающего списка с именем "Поставщик" я выбираю точное значение 'Магазин "Бытовая техника"'
* заполнение ТЧ	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Sony К3456P'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,00'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'Товар'       | 'Цена'     | 'Артикул' | 'Количество' | 'Сумма'    |
		| 'Sony К3456P' | '4 500,00' | 'Н657'    | '10,00'       | '4 500,00' |
	И я нажимаю на кнопку с именем "ФормаЗаписать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа	
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
Тогда открылось окно 'Поступления товаров'
И в таблице "Список" я активизирую поле с именем "Номер"
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |
	
Сценарий: Проверка наличия в справочнике номенклатуры Торт
И В командном интерфейсе я выбираю 'Продажи' 'Товары'
Тогда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Торт'   |