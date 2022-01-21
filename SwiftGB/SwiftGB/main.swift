//
//  main.swift
//  DZ03
//
//  Created by Артём on 25.10.2021.
//

import Foundation

// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

// MARK: - Перечисления

enum windowCar: String {
    case open = "окна открыты"
    case closed = "окна закрыты"
}

enum engineState: String {
    case Start = "Двигатель запущен"
    case Stop = "Двигатель Остановлен"
}

enum baggageFill: String {
    case Full = "Багажник заполнен полностью"
    case Empty = "Багажник пуст"
    case partially = "Багажник запонен на - "
    case overload = "Перегруз багажа! попробуйте добавить меньше груза"
}

enum actionCar: String {
    case openWindow = "Окткрыть окна"
    case closedWindow = "Закрыть окна"
    case startEngine = "Завести двигатель"
    case stopEngine = "Заглушить двигатель"
    case putLuggage = "Положить груз в багажник"
    case removeLuggage = "Вытащить груз из багажника"
    
    
}

// MARK: - Структура

struct car {
    let brand:String // марка авто
    let yearCar: Int // год выпуска
    let baggageVolume:Int // объём багажника
    var engine: engineState {
        didSet{
            print(engine.rawValue)
        }
    }
    
    var windows: windowCar {
        didSet {
            print(windows.rawValue)
        }
    }
    
    var volumebaggageLoading: Int   // колличество груза багажа
    
    mutating func loadingBaggage(_ volumebaggageLoading: Int){
        if baggageVolume == volumebaggageLoading {
            print(baggageFill.Full.rawValue)
            
        }
        if baggageVolume > volumebaggageLoading {
            print(baggageFill.partially.rawValue, baggageVolume - volumebaggageLoading," литров")
        }
        if baggageVolume < volumebaggageLoading {
            print(baggageFill.overload.rawValue)
            
        }
        else{
            print(baggageFill.Empty.rawValue)
        }
    }
    
    func ActionCar(type: actionCar){
        switch type {
        case .openWindow:
            print(windowCar.open.rawValue)
        case .closedWindow:
            print(windowCar.closed.rawValue)
            
        case .startEngine:
            print(engineState.Start.rawValue)
            
        case .stopEngine:
            print(engineState.Stop.rawValue)
            //        case .putLuggage:
            //            print(loadingBaggage.)
            
        default:
            print("Zdelaite chtoto s auto")
        }
    }
    
    mutating func CarInfo(){
        print("_______________________")
        print("Модель авто - \(brand)")
        print("Год выпуска - \(yearCar)")
        print("Объём багажгика - \(baggageVolume)")
    }
    
    
    init(brand: String, yearCar: Int, baggageVolume: Int) {
        self.brand = brand
        self.yearCar = yearCar
        self.baggageVolume = baggageVolume
        self.engine = .Stop
        self.windows = .closed
        self.volumebaggageLoading = 0
        
        
    }
}
var sprotCar = car(brand: "BMW", yearCar: 2020, baggageVolume: 1500)
var truckCar = car(brand: "MAN", yearCar: 1999, baggageVolume: 50000)

sprotCar.CarInfo()
sprotCar.ActionCar(type: .openWindow)
sprotCar.ActionCar(type: .startEngine)
sprotCar.loadingBaggage(30000)



truckCar.CarInfo()
truckCar.ActionCar(type: .closedWindow)
truckCar.ActionCar(type: .stopEngine)
truckCar.loadingBaggage(20000)


