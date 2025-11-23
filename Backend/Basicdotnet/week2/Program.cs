using System;

class Program
{
    static void Main(string[] args)
    {
       // AverageUntilTenRounded();
       // SumEndingWithZero();
       // GenerateUntilFifty();
       // CalculateIdealWeightWeek2();
       // CalculateTicketPriceWeek2();
    }

//Klavyeden 10 rakamını girene kadar kullanıcıdan sayı almaya devam eden
//ve alınan sayıların ortalamasını hesaplayıp ortalamayı en yakın tam sayıya yuvarlayan uygulama.
static void AverageUntilTenRounded()
{
    int total = 0;
    int count = 0;
    int number = 0;
    Console.WriteLine("Sayı girmeye başlayın. Program, 10 girildiğinde durur ve ortalamayı yuvarlar.");

    while (true)
    {
        Console.Write("Sayı: ");
        if (!int.TryParse(Console.ReadLine(), out number))
        {
            Console.WriteLine("Geçerli bir sayı giriniz.");
            continue;
        }

        if (number == 10)
            break;

        total += number;
        count++;
    }

    if (count > 0)
    {
        double avg = (double)total / count;
        int rounded = (int)Math.Round(avg);
        Console.WriteLine("Yuvarlanmış Ortalama: " + rounded);
    }
    else
    {
        Console.WriteLine("Hiç sayı girilmedi, ortalama hesaplanamadı.");
    }
}
//Random atanan 7 sayıyı bir dizide tutan ve bu sayılardan son rakamı 0 olanların
//toplamını bulan program. (Metot olarak hazırlanacak)
static void SumEndingWithZero()
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

    Console.WriteLine("Sonu 0 ile biten sayıların toplamı: " + total);
}
//1 ile 100 arasında rastgele sayı üreten ve 50 sayısını üretene kadar sayı üretmeye devam eden
//50 üretildiğinde durup kaç sayı üretildiğini ve üretilen sayıları gösteren uygulama.
static void GenerateUntilFifty()
{
    Random rnd = new Random();
    int number = 0;
    int count = 0;

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
//Klavyeden girilen boy ve cinsiyet bilgilerine göre kişinin ideal kilosunu hesaplayan uygulama.
//Kadın ve erkek için iki ayrı metot kullanılacaktır.

static void CalculateIdealWeightWeek2()
{
    Console.Write("Boyunuzu cm olarak giriniz: ");
    double height = Convert.ToDouble(Console.ReadLine());

    Console.Write("Cinsiyet (kadın / erkek): ");
    string gender = (Console.ReadLine() ?? string.Empty).ToLower();

    if (gender == "kadın" || gender == "kadin")
    {
        double result = IdealWeightFemale(height);
        Console.WriteLine("İdeal Kilonuz = " + result + " kg");
    }
    else if (gender == "erkek")
    {
        double result = IdealWeightMale(height);
        Console.WriteLine("İdeal Kilonuz = " + result + " kg");
    }
    else
    {
        Console.WriteLine("Hatalı cinsiyet girdiniz!");
    }
}


static double IdealWeightFemale(double height)
{
    if (height <= 150)
        return 45;

    double extra = height - 150;
    return 45 + (extra / 2.5) * 2.2;
}

static double IdealWeightMale(double height)
{
    if (height <= 150)
        return 48;

    double extra = height - 150;
    return 48 + (extra / 2.5) * 2.7;
}

//Kullanıcının ulaşım türüne göre (YURTDIŞI / YURTİÇİ) bilet fiyatı hesaplayan uygulama.
//Zam ve indirim işlemleri ayrı metotlarla yapılacaktır.

static void CalculateTicketPriceWeek2()
{
    Console.Write("Ulaşım türü (yurtdışı / yurtiçi): ");
    string type = (Console.ReadLine() ?? string.Empty).ToLower();

    Console.Write("Bilet fiyatı: ");
    double price = Convert.ToDouble(Console.ReadLine());

    Console.Write("Bilet adedi: ");
    int qty = Convert.ToInt32(Console.ReadLine());

    double total = price * qty;

    if (type == "yurtdışı" || type == "yurtdisi")
    {
        Console.WriteLine("Avrupa (A), Asya (B), Afrika (C) seçeneklerinden birini giriniz:");
        Console.Write("Seçim: ");
        string choice = (Console.ReadLine() ?? string.Empty).ToUpper();

        switch (choice)
        {
            case "A":
                total = ApplyIncrease(total, 0.27);
                break;
            case "B":
                total = ApplyIncrease(total, 0.17);
                break;
            case "C":
                total = ApplyIncrease(total, 0.07);
                break;
            default:
                Console.WriteLine("Hatalı seçim!");
                return;
        }

        Console.WriteLine("Zamlı Tutar: " + total + " TL");
    }
    else if (type == "yurtiçi" || type == "yurtici")
    {
        Console.Write("Uçuş günü (hafta içi / hafta sonu): ");
        string day = (Console.ReadLine() ?? string.Empty).ToLower();

        if (day == "hafta içi" || day == "haftaici")
        {
            total = ApplyDiscount(total, 0.27);
        }
        else if (day == "hafta sonu" || day == "haftasonu")
        {
            total = ApplyDiscount(total, 0.07);
        }
        else
        {
            Console.WriteLine("Hatalı gün tipi!");
            return;
        }

        Console.WriteLine("İndirimli Tutar: " + total + " TL");
    }
    else
    {
        Console.WriteLine("Hatalı ulaşım türü!");
    }
}


static double ApplyIncrease(double total, double rate)
{
    return total + (total * rate);
}


static double ApplyDiscount(double total, double rate)
{
    return total - (total * rate);
}
}


//Week 2 Ödev Sonu
//24.11.2025
