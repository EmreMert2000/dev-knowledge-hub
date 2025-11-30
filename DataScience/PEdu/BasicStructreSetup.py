
import numpy as np # type: ignore



def calculate_statistics_numpy(data):
    data_array = np.array(data)
    return {
        'mean': np.mean(data_array),
        'median': np.median(data_array),
        'std_dev': np.std(data_array),
        'min': np.min(data_array),
        'max': np.max(data_array),
        'variance': np.var(data_array)
    }

if __name__ == "__main__":
    # Test verileri
    test_data = [10, 20, 30, 60, 70, 80, 90, 100]
    
    # İstatistikleri hesapla
   
    # NumPy ile istatistikleri hesapla
    results_numpy = calculate_statistics_numpy(test_data)
    
    # Sonuçları yazdır
    print("Test verileri:", test_data)
   
    print("Minimum:", results_numpy['min'])
    print("Maksimum:", results_numpy['max'])
    print("Varyans:", results_numpy['variance'])

    # Numpy Sonuçlarını yazdırmayı kullanan
    #BasicStructreSetup.py dosyasındaki fonksiyonları kullanabilirsiniz.