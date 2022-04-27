﻿#language: ru
@tree

Функционал: Проверка отчета Остатки

Контекст:	
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения	
	
Сценарий: Проверка отчета Остатки

* Загрузка данных
	И Загрузка прихода и расхода

* Проведение загруженных документов
	И я выполняю код встроенного языка на сервере		
		| 'Документы.ПриходТовара.НайтиПоНомеру("000000001").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.РасходТовара.НайтиПоНомеру("000000001").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |

* Формирование отчета Остатки
	И В командном интерфейсе я выбираю 'Закупки' 'Остатки товаров'
	Тогда открылось окно 'Остатки товаров'
	И я нажимаю на кнопку с именем 'ФормаИзменитьВариант'
	Тогда открылось окно 'Вариант "Основной" отчета "Остатки товаров"'
	И в таблице "КомпоновщикНастроекНастройкиПараметрыДанных" я нажимаю на кнопку с именем 'КомпоновщикНастроекНастройкиПараметрыДанныхСвойстваЭлементаПользовательскойНастройки'
	Тогда открылось окно 'Пользовательские настройки элемента'
	И Я закрываю окно 'Пользовательские настройки элемента'
	Тогда открылось окно 'Вариант "Основной" отчета "Остатки товаров"'
	И я перехожу к закладке с именем "СтраницаПараметровДанных"
	И я выбираю пункт контекстного меню с именем 'КомпоновщикНастроекНастройкиКонтекстноеМенюДобавитьГруппировку' на элементе формы с именем "КомпоновщикНастроекНастройки"
	Тогда открылось окно 'Группировка'
	И я нажимаю кнопку выбора у поля с именем "Field"
	Тогда открылось окно 'Выбор поля'
	И в таблице "Source" я выбираю текущую строку
	Тогда открылось окно 'Группировка'
	И я нажимаю на кнопку с именем 'OK'
	Тогда открылось окно 'Вариант "Основной" отчета "Остатки товаров"'
	И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'
	Тогда открылось окно 'Остатки товаров'
	И я нажимаю на кнопку с именем 'ФормаСформировать'

* Проверка отчета
	Тогда Табличный документ "Результат" равен макету "ШаблонОтчетаОстатков" по шаблону
