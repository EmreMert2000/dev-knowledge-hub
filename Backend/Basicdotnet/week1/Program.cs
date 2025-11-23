using System;

class Program
{
    static void Main(string[] args)
    {
        //CheckWaterState();
       //CalcScholarship();
        //CalcScholarship_Swich();
       // CalculateCommission();
        //SalesCommissionProgram();
        //CalcElectricBill();
        //DivisibleByThree();
        //SumUntilNumber();
        //SumBetweenNumbers();
        //SumUntilHundredExceeded();
        //ShapeCalculator();
        //FindSmallestNumber();
        //AverageUntilTen();
        //SumNumbersEndingWithZero();
        //GenerateUntilFifty();
        //CalculateIdealWeight();
        //CalculateTicketPrice();
    }
    
     //Suyun sıcaklık değeri dirildiğinde suyun sıcaklığına göre maddenin halini(katı, sıvı, gaz)
     // gösteren program. Not: suyun kaynama ısısı 100 donma ısısı 0 derece
    static void CheckWaterState()
    {
        Console.WriteLine("Suyun sıcaklık değerini giriniz:");
        double temperature = Convert.ToDouble(Console.ReadLine());

        if (temperature < 0)
        {
            Console.WriteLine("Suyun hali: Katı (Buz)");
        }
        else if (temperature >= 100)
        {
            Console.WriteLine("Suyun hali: Gaz (Buhar)");
        }
        else
        {
            Console.WriteLine("Suyun hali: Sıvı");
        }
    }

   
//Muhtaç öğrencilere taban olarak 1000TL burs verilmektedir. Ancak öğrencinin okuduğu
//okula göre bu paranın üzerine belirli miktarda ekleme yapılacaktır. Eğer ilkokul ise ekleme
//yapılmayacak, ortaokul ise 200TL, lise ise 500TL, üniversite ise 1000TL eklenecektir.
//Öğrencinin okuduğu okulun seçimine göre kaç tl burs alacağını gösteren uygulama.
   
    static void CalcScholarship()
    {
        int baseScholarship = 1000;

        Console.WriteLine("Okul türünü giriniz (ilkokul / ortaokul / lise / üniversite): ");
        string school = Console.ReadLine().ToLower();

        int totalScholarship = baseScholarship;

        if (school == "ilkokul")
        {
            totalScholarship = baseScholarship;
        }
        else if (school == "ortaokul")
        {
            totalScholarship = baseScholarship + 200;
        }
        else if (school == "lise")
        {
            totalScholarship = baseScholarship + 500;
        }
        else if (school == "üniversite" || school == "universite")
        {
            totalScholarship = baseScholarship + 1000;
        }
        else
        {
            Console.WriteLine("Hatalı okul türü girdiniz!");
            return;
        }

        Console.WriteLine("Toplam alacağınız burs: " + totalScholarship + " TL");
    }

  
    static void CalcScholarship_Swich()
    {
        int baseScholarship = 1000;

        Console.WriteLine("Okul türünü giriniz (ilkokul / ortaokul / lise / üniversite): ");
        string school = Console.ReadLine().ToLower();

        int totalScholarship = baseScholarship;

        switch (school)
        {
            case "ilkokul":
                totalScholarship = baseScholarship;
                break;

            case "ortaokul":
                totalScholarship = baseScholarship + 200;
                break;

            case "lise":
                totalScholarship = baseScholarship + 500;
                break;

            case "üniversite":
            case "universite":
                totalScholarship = baseScholarship + 1000;
                break;

            default:
                Console.WriteLine("Hatalı okul türü girdiniz!");
                return;
        }

        Console.WriteLine("Toplam alacağınız burs: " + totalScholarship + " TL");
    }

//Bir satıcı sattığı mallardan belirli oranda komisyon almaktadır. 200TL’ye kadar olan
//satışlardan %3, daha fazla olanlardan ise %2 komisyon almaktadır. Buna göre
//klavyeden girilen 3 satış miktarından satıcının alacağı komisyonları ve toplam komisyonu
//ekrana yazan program.
    static double CalculateCommission(double saleAmount)
    {
        if (saleAmount <= 200)
        {
            return saleAmount * 0.03; 
        }
        else
        {
            return saleAmount * 0.02; 
        }
    }

 
    static void SalesCommissionProgram()
    {
        double totalCommission = 0;

        Console.WriteLine("3 adet satış miktarı giriniz:");

        for (int i = 1; i <= 3; i++)
        {
            Console.Write("Satış " + i + ": ");
            double sale = Convert.ToDouble(Console.ReadLine());

            double commission = CalculateCommission(sale); 
            Console.WriteLine($"→ Bu satıştan alınan komisyon: {commission} TL\n");

            totalCommission += commission;
        }

        Console.WriteLine("----------------------------------");
        Console.WriteLine("Toplam komisyon: " + totalCommission + " TL");
    }

//Aylık elektrik faturası hesaplanacaktır. Kullanıcıdan kaç kWh tükettiğini alınız. Eğer
//tüketim 150’den küçükse kWh’i 10 kuruş, eğer 150 ile 300 arasında ise 20 kuruş,
//300 üzeri ise 40 kuruş olarak hesaplanmaktadır. Kişinin yaptığı tüketime göre faturasının kaç
//TL olacağını hesaplayıp ekrana yazan program.
static void CalcElectricBill()
{
    Console.Write("Tüketilen kWh miktarını giriniz: ");
    double kWh = Convert.ToDouble(Console.ReadLine());
    double price = 0;

    if (kWh < 150)
    {
        price = kWh * 0.10;
    }
    else if (kWh >= 150 && kWh <= 300)
    {
        price = kWh * 0.20;
    }
    else
    {
        price = kWh * 0.40;
    }

    Console.WriteLine("Toplam elektrik faturanız: " + price + " TL");
//Rastgele atanan 7 sayıyı bir dizide tutan ve bu sayılardan son rakamı 0 olanların
//toplamını bulan program.
static void SumNumbersEndingWithZero()
{
    int[] numbers = new int[7];
    Random rnd = new Random();
    int total = 0;

    Console.WriteLine("Rastgele üretilen sayılar:");

    for (int i = 0; i < numbers.Length; i++)
    {
        numbers[i] = rnd.Next(1, 200); 
        Console.WriteLine(numbers[i]);

        if (numbers[i] % 10 == 0)
        {
            total += numbers[i];
        }
    }

    Console.WriteLine("Sonu 0 olan sayıların toplamı: " + total);
}
//1 ile 100 arasında rastgele sayı üreten ve 50 sayısını üretene kadar sayı üretmeye devam eden,
//50 sayısı üretildiğinde durup kaç adet sayı üretildiğini ve üretilen sayıları gösteren uygulama.
static void GenerateUntilFifty()
{
    Random rnd = new Random();
    int count = 0;
    int number = 0;

    Console.WriteLine("Rastgele sayılar üretiliyor (1-100)...");

    while (number != 50)
    {
        number = rnd.Next(1, 101);
        Console.WriteLine(number);
        count++;
    }

    Console.WriteLine("50 sayısı üretildi!");
    Console.WriteLine("Toplam üretilen sayı adedi: " + count);
}
}

//1 den 100 e kadar olan sayılardan 3 e tam bölünenlerini ekranda göstericek 
//ve toplamda kaç adet 3 e bölünen sayı olduğunu gösterecek uygulama.
static void DivisibleByThree()
{
    int count = 0;

    Console.WriteLine("1 ile 100 arasındaki 3'e tam bölünen sayılar:");

    for (int i = 1; i <= 100; i++)
    {
        if (i % 3 == 0)
        {
            Console.WriteLine(i);
            count++;
        }
    }

    Console.WriteLine("Toplam 3'e bölünen sayı adedi: " + count);
}
//1 den başlayarak kullanıcıdan istenilen sayıya kadar olan sayıların toplamının sonucu
//bulacak uygulama.
static void SumUntilNumber()
{
    Console.Write("Bir sayı giriniz: ");
    int number = Convert.ToInt32(Console.ReadLine());

    int total = 0;

    for (int i = 1; i <= number; i++)
    {
        total += i;
    }

    Console.WriteLine("1'den " + number + " sayısına kadar olan sayıların toplamı: " + total);
}
//Kullanıcıdan alınan iki değer arasındaki sayıların toplamını gösteren uygulama.
static void SumBetweenNumbers()
{
    Console.Write("Birinci sayıyı giriniz: ");
    int num1 = Convert.ToInt32(Console.ReadLine());

    Console.Write("İkinci sayıyı giriniz: ");
    int num2 = Convert.ToInt32(Console.ReadLine());

    int start = Math.Min(num1, num2);
    int end = Math.Max(num1, num2);

    int total = 0;

    for (int i = start; i <= end; i++)
    {
        total += i;
    }

    Console.WriteLine(start + " ile " + end + " arasındaki sayıların toplamı: " + total);
}
    

//Kullanıcıdan girdiği sayıların toplamı 100'ü geçene kadar sayı isteyen,
//toplam 100'ü geçtiği anda kaç adet sayı girildiğini ve toplam sonucu ekrana yazan uygulama.
static void SumUntilHundredExceeded()
{
    int total = 0;
    int count = 0;

    while (total <= 100)
    {
        Console.Write("Sayı giriniz: ");
        int number = Convert.ToInt32(Console.ReadLine());

        total += number;
        count++;
    }

    Console.WriteLine("Toplam 100'ü geçti!");
    Console.WriteLine("Girilen sayı adedi: " + count);
    Console.WriteLine("Toplam: " + total);
}

//Kare, üçgen ve dikdörtgenler için alan ve çevre hesabı yapan uygulama.
//Kullanıcıdan şekil seçimi ve ilgili kenar uzunluklarını alıp alan ve çevre hesaplar.
static void ShapeCalculator()
{
    Console.WriteLine("Hangi şekil? (kare / üçgen / dikdörtgen): ");
    string shape = Console.ReadLine().ToLower();

    switch (shape)
    {
        case "kare":
            Console.Write("Karenin bir kenarını giriniz: ");
            double k = Convert.ToDouble(Console.ReadLine());
            double kareAlan = k * k;
            double kareCevre = 4 * k;
            Console.WriteLine("Karenin Alanı: " + kareAlan);
            Console.WriteLine("Karenin Çevresi: " + kareCevre);
            break;

        case "üçgen":
            Console.Write("1. kenarı giriniz: ");
            double u1 = Convert.ToDouble(Console.ReadLine());
            Console.Write("2. kenarı giriniz: ");
            double u2 = Convert.ToDouble(Console.ReadLine());
            Console.Write("3. kenarı giriniz: ");
            double u3 = Convert.ToDouble(Console.ReadLine());
            double ucgenCevre = u1 + u2 + u3;

            double s = ucgenCevre / 2; 
            double ucgenAlan = Math.Sqrt(s * (s - u1) * (s - u2) * (s - u3));

            Console.WriteLine("Üçgenin Alanı: " + ucgenAlan);
            Console.WriteLine("Üçgenin Çevresi: " + ucgenCevre);
            break;

        case "dikdörtgen":
            Console.Write("Kısa kenarı giriniz: ");
            double dk1 = Convert.ToDouble(Console.ReadLine());
            Console.Write("Uzun kenarı giriniz: ");
            double dk2 = Convert.ToDouble(Console.ReadLine());
            double dikAlan = dk1 * dk2;
            double dikCevre = 2 * (dk1 + dk2);
            Console.WriteLine("Dikdörtgenin Alanı: " + dikAlan);
            Console.WriteLine("Dikdörtgenin Çevresi: " + dikCevre);
            break;

        default:
            Console.WriteLine("Hatalı şekil seçimi!");
            break;
    }
}

//Klavyeden girilen 3 sayının içinden en küçüğünü bulan ve 
//“En küçük sayı: ….” şeklinde ekrana yazan program.
static void FindSmallestNumber()
{
    Console.Write("1. sayıyı giriniz: ");
    double n1 = Convert.ToDouble(Console.ReadLine());

    Console.Write("2. sayıyı giriniz: ");
    double n2 = Convert.ToDouble(Console.ReadLine());

    Console.Write("3. sayıyı giriniz: ");
    double n3 = Convert.ToDouble(Console.ReadLine());

    double smallest = Math.Min(n1, Math.Min(n2, n3));

    Console.WriteLine("En küçük sayı: " + smallest);
}

//Klavyeden 10 rakamını girene kadar kullanıcıdan sayı almaya devam eden
//ve alınan sayıların ortalamasını hesaplayıp gösteren uygulama.
static void AverageUntilTen()
{
    int total = 0;
    int count = 0;
    int number = 0;

    Console.WriteLine("Sayı girmeye başlayın. Program, 10 girildiğinde durur.");

    while (true)
    {
        Console.Write("Sayı: ");
        number = Convert.ToInt32(Console.ReadLine());

        if (number == 10)
            break;

        total += number;
        count++;
    }

    if (count > 0)
    {
        double average = (double)total / count;
        Console.WriteLine("Girilen sayıların ortalaması: " + average);
    }
    else
    {
        Console.WriteLine("Hiç sayı girilmedi, ortalama hesaplanamadı.");
    }
}


//Klavyeden girilen boy ve cinsiyet bilgilerine göre ideal kilo hesaplayan uygulama.
//Kadın: 150 cm için 45 kg, sonrası her 2.5 cm için 2.2 kg eklenir.
//Erkek: 150 cm için 48 kg, sonrası her 2.5 cm için 2.7 kg eklenir.
static void CalculateIdealWeight()
{
    Console.Write("Boyunuzu cm olarak giriniz: ");
    double height = Convert.ToDouble(Console.ReadLine());

    Console.Write("Cinsiyet (kadın/erkek): ");
    string gender = Console.ReadLine().ToLower();

    double idealWeight = 0;

    if (gender == "kadın" )
    {
        if (height <= 150)
        {
            idealWeight = 45;
        }
        else
        {
            double extra = height - 150;
            idealWeight = 45 + (extra / 2.5) * 2.2;
        }
    }
    else if (gender == "erkek")
    {
        if (height <= 150)
        {
            idealWeight = 48;
        }
        else
        {
            double extra = height - 150;
            idealWeight = 48 + (extra / 2.5) * 2.7;
        }
    }
    else
    {
        Console.WriteLine("Hatalı cinsiyet girdiniz!");
        return;
    }

    Console.WriteLine("İdeal Kilonuz: " + idealWeight + " kg");
}   


//Kullanıcının ulaşım türünü YURTDIŞI veya YURTİÇİ seçmesine göre bilet hesaplama uygulaması.
static void CalculateTicketPrice()
{
    Console.Write("Ulaşım türü (yurtdışı / yurtiçi): ");
    string type = Console.ReadLine().ToLower();

    Console.Write("Bilet fiyatını giriniz: ");
    double price = Convert.ToDouble(Console.ReadLine());

    Console.Write("Bilet adedini giriniz: ");
    int qty = Convert.ToInt32(Console.ReadLine());

    double total = price * qty;

    if (type == "yurtdışı" )
    {
        Console.WriteLine("Kıta seçiniz: Avrupa (A) / Asya (B) / Afrika (C)");
        Console.Write("Seçim: ");
        string choice = Console.ReadLine().ToUpper();

        switch (choice)
        {
            case "A":
                total += total * 0.27;
                break;
            case "B":
                total += total * 0.17;
                break;
            case "C":
                total += total * 0.07;
                break;
            default:
                Console.WriteLine("Hatalı seçim!");
                return;
        }

        Console.WriteLine("Toplam tutar (zamlı): " + total + " TL");
    }
    else if (type == "yurtiçi" )
    {
        Console.Write("Gün tipi (hafta içi / hafta sonu): ");
        string day = Console.ReadLine().ToLower();

        if (day == "hafta içi")
        {
            total -= total * 0.27;
        }
        else if (day == "hafta sonu")
        {
            total -= total * 0.07;
        }
        else
        {
            Console.WriteLine("Hatalı gün tipi!");
            return;
        }

        Console.WriteLine("Toplam tutar (indirimli): " + total + " TL");
    }
    else
    {
        Console.WriteLine("Hatalı ulaşım türü!");
    }
} 
} 