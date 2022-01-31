//  Created by Admin
import Foundation
//
//  main.swift
//  dz.04
//
//  Created by Артём on 31.10.2021.
//
//
//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
// готово
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//готово
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.
import Foundation
// MARK: - Перечисления

enum WindowCar: String {
    case Open = "окна открыты"
    case Closed = "окна закрыты"
}

enum EngineState: String {
    case Start = "Двигатель запущен"
    case Stop = "Двигатель Остановлен"
}

enum BaggageFill: String {
    case Full = "Багажник заполнен полностью"
    case Empty = "Багажник пуст"
    case Partially = "Багажник запонен на - "
    case Overload = "Перегруз багажа! попробуйте добавить меньше груза"
}

enum ActionCar: String {
    case OpenWindow = "Окткрыть окна"
    case ClosedWindow = "Закрыть окна"
    case StartEngine = "Завести двигатель"
    case StopEngine = "Заглушить двигатель"
    case PutLuggage = "Положить груз в багажник"
    case RemoveLuggage = "Вытащить груз из багажника"
    
}

enum TruckCarTank: String {    // Особенности грузовой машины
    case CarTank = "Топлива в баке - "
    case CarTankEmpty = "Топливо закончилось"
    case CarTankMax = "Топливный бак полон"
    
}

enum SportCarSpeed: String {    // Особенности спортивной машины
    case CarSpeed = "Скорость автомобиля - "
    case CarSpeedStop = "Автомобиль остановился"
    case CarSpeedMax = "Автомобиль достиг максимальной скорости"
}



// MARK: - Класс родительский

class car {
    let brand:String // марка авто
    let yearCar: Int // год выпуска
    let baggageVolume:Int // объём багажника
    var engine: EngineState {
        didSet{
            print(engine.rawValue)
        }
    }

    var windows: WindowCar {
        didSet {
            print(windows.rawValue)
        }
    }

    var volumebaggageLoading: Int   // колличество груза багажа

    func loadingBaggage(volumebaggageLoading: Int){
        if baggageVolume == volumebaggageLoading {
            print(BaggageFill.Full.rawValue)

        }
        if baggageVolume > volumebaggageLoading {
            print(BaggageFill.Partially.rawValue)
        }
        if baggageVolume < volumebaggageLoading {
            print(BaggageFill.Overload.rawValue)

        }
        if volumebaggageLoading == 0{
            print(BaggageFill.Empty.rawValue)
        }
    }

    func ActionCar(type: ActionCar){
        switch type {
        case .OpenWindow:
            print(WindowCar.Open.rawValue)
        case .ClosedWindow:
            print(WindowCar.Closed.rawValue)

        case .StartEngine:
            print(EngineState.Start.rawValue)

        case .StopEngine:
            print(EngineState.Stop.rawValue)
            //        case .putLuggage:
            //            print(loadingBaggage.)

        default:
            print("Zdelaite chtoto s auto")
        }
    }

    func CarInfo(){
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
        self.windows = .Closed
        self.volumebaggageLoading = 0


    }
}

// MARK: - Класс грузового автомобиля

final class TruckCar: car {
    let volumeTank: Int
    
    var volumeTruckCarTank: Int
        
    func valumeTankCar(volumeTruckCarTank: Int) {
        if volumeTank == volumeTruckCarTank {
            print(TruckCarTank.CarTankMax.rawValue)
        }
        if volumeTruckCarTank == 0 {
            print(TruckCarTank.CarTankEmpty.rawValue)
        }
        if volumeTank < volumeTruckCarTank {
            print(TruckCarTank.CarTank,volumeTruckCarTank)
        }
    }
    init(brand: String, yearCar: Int, baggageVolume: Int, volumeTank: Int) {
        self.volumeTank = volumeTank
        self.volumeTruckCarTank = 0
        super.init(brand: brand, yearCar: yearCar, baggageVolume: baggageVolume)
        }
}

// MARK: - Класс спортивного автомобиля

class SportCar: car {
    let speedMax: Int
    
    var volumeSpeedCar: Int
    
    
    init(brand: String, yearCar: Int, baggageVolume: Int, speedMax: Int) {
        self.speedMax = speedMax
        self.volumeSpeedCar = 0
        super.init(brand: brand, yearCar: yearCar, baggageVolume: baggageVolume)
    }
    
    func volumeSpeed(volumeSpeedCar: Int) {
        if speedMax == volumeSpeedCar {
            print(SportCarSpeed.CarSpeedMax.rawValue)
        }
        if volumeSpeedCar == 0 {
            print(SportCarSpeed.CarSpeedStop.rawValue)
        }
       else {
           print(SportCarSpeed.CarSpeed.rawValue,volumeSpeedCar)
        }

    }
 }


final class SportCarLife: SportCar {
    override func volumeSpeed(volumeSpeedCar: Int) {
        super.volumeSpeed(volumeSpeedCar: volumeSpeedCar)
        print("Error")
    }
}
// MARK: -  Объекты класса

var sprotCar = SportCarLife(brand: "BMW", yearCar: 2020, baggageVolume: 1500, speedMax: 300)
var truckCar = TruckCar(brand: "MAN", yearCar: 1990, baggageVolume: 50000, volumeTank: 500)


// MARK: - Действия с объектами

sprotCar.CarInfo()
sprotCar.ActionCar(type: .OpenWindow)
sprotCar.ActionCar(type: .StartEngine)
sprotCar.loadingBaggage(volumebaggageLoading: 30000)
sprotCar.volumeSpeed(volumeSpeedCar: 290)



truckCar.CarInfo()
truckCar.ActionCar(type: .ClosedWindow)
truckCar.ActionCar(type: .StopEngine)
truckCar.loadingBaggage(volumebaggageLoading: 500)
truckCar.valumeTankCar(volumeTruckCarTank: 600)
