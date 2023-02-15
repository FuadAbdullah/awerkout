<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="Nutrition.aspx.cs" Inherits="awerkout.Nutrition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="nutritionstyle.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
     <table style="width: 100%;" class="table">
        <tr>
            <td>
                <asp:LinkButton ID="myProfilelnk" class="nav" runat="server" OnClick="myProfilelnk_Click">My Profile</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="signOutlnk" class="nav" runat="server" OnClick="signOutlnk_Click">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
    <table style="width: 100%;" class="table">
        <tr>
            <td>
                <asp:LinkButton ID="signinlnk" class="nav" runat="server" OnClick="signInlnk_Click">Sign In</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <asp:Label ID="greetLbl" runat="server" Text="Hello there!" Font-Bold="True"></asp:Label>
    <div class="container" style="font-size: 40px;">
        <div class="header" style="margin-top: 100px; color: #ff9f00 ">
            Calorie Needs and Macronutrients
        </div>
        <div class="content" style="font-size: 25px; font-style: italic;">
            <br />
            The goal for competitive bodybuilders is to 
            increase muscle mass in the bulking phase and reduce 
            body fat in the cutting phase. Hence, you consume more 
            calories in the bulking phase than in the cutting phase.
        </div>

        <br/>

        <div class="header" style="color: #fe5a1d ">
            How Many Calories Do You Need?
        </div>
        <div class="content" style="font-size: 25px; font-style: italic;">
            <br />
            The easiest way to determine how many calories you 
            need is to weigh yourself at least three times a week and record 
            what you eat using a calorie tracking app.
            <br />
            <br />
            If your weight stays the same, the daily number of calories 
            you eat is your maintenance calories. This is the level where 
            you’re not losing or gaining weight but maintaining it.
            <br />
            <br />
            During your bulking phase, you should increase your calorie intake 
            by around 15%. For example, if your maintenance calories are 
            3,000 per day, you should eat 3,450 calories per day (3,000 x 0.15 = 450) 
            during your bulking phase (6Trusted Source).
            <br />
            <br />
            When transitioning from a bulking to a cutting phase, you would instead 
            decrease your maintenance calories by 15%, meaning you would eat 2,550 
            calories per day instead of 3,450.
            <br />
            <br />
            As you gain weight in the bulking phase or lose weight in the cutting phase, 
            you will need to adjust your calorie intake at least monthly to account 
            for changes in your weight.
            <br />
            <br />
            Increase your calories as you gain weight in the bulking phase and decrease 
            your calories as you lose weight in the cutting phase for continued progression.
            <br />
            <br />
            During either phase, it’s recommended not to lose or gain more than 0.5–1% 
            of your body weight per week. This ensures that you don’t lose too much 
            muscle during the cutting phase or gain too much body fat during the 
            bulking phase (7Trusted Source).
        </div>

        <br/>

        <div class="header" style="color: #f77f00 ">
            Macronutrient Ratio
        </div>
        <div class="content" style="font-size: 25px; font-style: italic;">
            <br />
            Once you establish the calories you need, you can determine your 
            macronutrient ratio, which is the ratio between your protein, 
            carbohydrate, and fat intake.
            <br />
            <br />
            Unlike the difference in calorie needs between the bulking and 
            cutting phase, your macronutrient ratio does not change.
            <br />
            <br />
            Protein and carbs contain four calories per gram (g), 
            and fat contains nine. Recommended intakes include: 
            (6Trusted Source, 7Trusted Source):
            <br />
            <br />
            <li>30–35% of your calories from protein</li><br />
            <li>55–60% of your calories from carbs</li><br />
            <li>15–20% of your calories from fat</li><br /><br />
            <br />
            Here’s an example of the ratio for both a bulking and cutting phase:
            <br />
            <br />
                <table class="auto-style1">
                    <tr>
                        <td>&nbsp;</td>
                        <td>Bulking phase</td>
                        <td>Cutting phase</td>
                    </tr>
                    <tr>
                        <td>Calories</td>
                        <td>3450</td>
                        <td>2550</td>
                    </tr>
                    <tr>
                        <td>Protein (g)</td>
                        <td>259-302</td>
                        <td>191-223</td>
                    </tr>
                    <tr>
                        <td>Carbohydrates (g)</td>
                        <td>474-518</td>
                        <td>351-383</td>
                    </tr>
                    <tr>
                        <td>Fat (g)</td>
                        <td>58-77</td>
                        <td>43-57</td>
                    </tr>
                </table>
            <br />
            These are general guidelines, so it’s best to consult with 
            a registered dietitian to determine your individual needs based on 
            your goals to ensure your diet is nutritionally adequate.
        </div>

        <br />

        <div class="header" style="color: #fe2712 ">
            Bodybuilding Nutrition: Foods to Eat and Avoid
        </div>
        <div class="content" style="font-size: 25px; font-style: italic;">
            <br />
            Like training, diet is a vital part of bodybuilding.
            <br />
            <br />
            Eating the right foods in the appropriate amounts provides your muscles with the nutrients they need to recover from workouts and grow bigger and stronger.
            <br />
            <br />
            Conversely, consuming the wrong foods or not enough of the right ones will leave you with subpar results.
            <br />
            <br />
            Here are foods you should focus on and foods to limit or avoid:
            <br />
            <br />
        </div>

        <br />

        <div class="header" style="color: #39ff14 ">
            Foods to Focus On
        </div>
        <div class="content" style="font-size: 25px; font-style: italic;">
            <br />
            The foods you eat don’t need to differ between the bulking and cutting phase — usually, it’s the amounts that do.
            <br />
            <br />
            Foods to eat include (7Trusted Source):
            <br />
            <br />
            <li>Meats, poultry, and fish: Sirloin steak, ground beef, pork tenderloin, venison, chicken breast, salmon, tilapia, and cod.</li><br />
            <li>Dairy: Yogurt, cottage cheese, low fat milk, and cheese.</li><br />
            <li>Grains: Bread, cereal, crackers, oatmeal, quinoa, popcorn, and rice.</li><br />
            <li>Fruits: Oranges, apples, bananas, grapes, pears, peaches, watermelon, and berries.</li><br />
            <li>Starchy vegetables: Potatoes, corn, green peas, green lima beans, and cassava.</li><br />
            <li>Vegetables: Broccoli, spinach, leafy salad greens, tomatoes, green beans, cucumber, zucchini, asparagus, peppers, and mushrooms.</li><br />
            <li>Seeds and nuts: Almonds, walnuts, sunflower seeds, chia seeds, and flax seeds.</li><br />
            <li>Beans and legumes: Chickpeas, lentils, kidney beans, black beans, and pinto beans.</li><br />
            <li>Oils: Olive oil, flaxseed oil, and avocado oil.</li><br /><br />
        </div>

        <br />

        <div class="header" style="color: #FF0000">
            Foods to Limit
        </div>
        <div class="content" style="font-size: 25px; font-style: italic;">
            <br />
            While you should include a variety of foods in your diet, there are some you should limit.            <br />
            <br />
            These include:
            <br />
            <br />
            <li>Alcohol: Alcohol can negatively affect your ability to build muscle and lose fat, especially if you consume it in excess (8Trusted Source).</li><br />
            <li>Added sugars: These offer plenty of calories but few nutrients. Foods high in added sugars include candy, cookies, doughnuts, ice cream, cake, and sugar-sweetened beverages, such as soda and sports drinks (5Trusted Source).</li><br />
            <li>Deep-fried foods: These may promote inflammation and — when consumed in excess — disease. Examples include fried fish, French fries, onion rings, chicken strips, and cheese curds (9Trusted Source).</li><br /><br />
            In addition to limiting these, you may also want to avoid certain foods before going to the gym that can slow digestion and cause stomach upset during your workout.
            <br />
            These include:
            <br />
            <br />
            <li>High-fat foods: High-fat meats, buttery foods, and heavy sauces or creams.</li><br />
            <li>High-fiber foods: Beans and cruciferous vegetables like broccoli or cauliflower.</li><br />
            <li>Carbonated beverages: Sparkling water or diet soda.</li><br /><br />
        </div>

        <br />

        <div class="header" style="color: #bf00ff ">
            Bodybuilding Supplements
        </div>
        <div class="content" style="font-size: 25px; font-style: italic;">
            <br />
            Many bodybuilders take dietary supplements, some of which are useful while others are not (10Trusted Source, 11Trusted Source).            <br />
            <br />
            The best bodybuilding supplements include:
            <br />
            <br />
            <li>Whey protein: Consuming whey protein powder is an easy and convenient way to increase your protein intake.</li><br />
            <li>Creatine: Creatine provides your muscles with the energy needed to perform an additional rep. While there are many brands of creatine, look for creatine monohydrate as it’s the most effective (12Trusted Source).</li><br />
            <li>Caffeine: Caffeine decreases fatigue and allows you to work harder. Pre-workout supplements, coffee, and tea are often high in caffeine. (13Trusted Source).</li><br /><br />
            A multi vitamin and mineral supplement may be helpful if you’re limiting your calorie intake to reduce body fat during your cutting phase.<br />
        </div>

        <br />

         <div class="header" style="color: #ff1493 ">
            One-Week Sample Menu
        </div>
        <div class="content" style="font-size: 25px; font-style: italic;">
            <br />
            Many people believe bodybuilding diets are restrictive, repetitive, and boring.<br />
            <br />
            Traditional bodybuilding diets typically contain limited food selections and little variety among and within food groups, leading to an inadequate intake of essential minerals and vitamins (14Trusted Source).
            <br />
            For this reason, it’s important to incorporate variety into your diet to ensure your nutritional needs are being met — especially during a cutting phase when you eat limited calories.<br />
            <br />
            When you’re in a bulking phase, your food intake will be much higher than when you’re in a cutting phase.
            <br />
            You can enjoy the same foods in the cutting phase that you would when bulking — just in smaller portions. <br />
            <br />
            <br />
            Here is a sample one-week bodybuilding menu:
            <br />
        <div class="header" style="color: #e32636 ">
            Monday
        </div>
        <div class="content">
            <br />
            <li>Breakfast: Scrambled eggs with mushrooms, oatmeal, and a pear.</li><br />
            <li>Snack: Low-fat cottage cheese with blueberries.</li><br />
            <li>Lunch: Venison burger, white rice, and broccoli.</li><br />
            <li>Snack: Protein shake and a banana.</li><br />
            <li>Dinner: Salmon, quinoa, and asparagus.</li><br />
            <br />
        </div>
        <div class="header" style="color: #ff6700 ">
            Tuesday
        </div>
        <div class="content">
            <br />
            <li>Breakfast: Protein pancakes with light syrup, peanut butter, and raspberries.</li><br />
            <li>Snack: Hard-boiled eggs and an apple.</li><br />
            <li>Lunch: Sirloin steak, sweet potato, and spinach salad with vinaigrette.</li><br />
            <li>Snack: Protein shake and a peach.</li><br />
            <li>Dinner: Ground turkey and marinara sauce over pasta, with a side of cauliflower.</li><br />
            <br />
        </div>
        <div class="header" style="color: #ffe135 ">
            Wednesday
        </div>
        <div class="content">
            <br />
            <li>Breakfast: Chicken sausage with egg, roasted potatoes, and an apple.</li><br />
            <li>Snack: Greek yogurt, strawberries, and almonds.</li><br />
            <li>Lunch: Turkey breast, basmati rice, and mushrooms.</li><br />
            <li>Snack: Protein shake and grapes.</li><br />
            <li>Dinner: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette.</li><br />
            <br />
        </div>
        <div class="header" style="color: #00ff7f">
            Thursday
        </div>
        <div class="content">
            <br />
            <li>Breakfast: Ground turkey, egg, cheese, and salsa in a whole-grain tortilla.</li><br />
            <li>Snack: Yogurt with granola and a pear.</li><br />
            <li>Lunch: Chicken breast, baked potato, sour cream, and broccoli.</li><br />
            <li>Snack: Protein shake and mixed berries.</li><br />
            <li>Dinner: Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots.</li><br />
            <br />
        </div>
        <div class="header" style="color: #4f86f7 ">
            Friday
        </div>
        <div class="content">
            <br />
            <li>Breakfast: Blueberries, strawberries, and Greek yogurt on overnight oats.</li><br />
            <li>Snack: Jerky and mixed nuts with an orange.</li><br />
            <li>Lunch: Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies.</li><br />
            <li>Snack: Protein shake and watermelon.</li><br />
            <li>Dinner: Ground beef with corn, brown rice, green peas, and beans.</li><br />
            <br />
        </div>
        <div class="header" style="color: #c8a2c8 ">
            Saturday
        </div>
        <div class="content">
            <br />
            <li>Breakfast: Ground turkey and egg with corn, bell peppers, cheese, and salsa.</li><br />
            <li>Snack: Can of tuna with crackers and an apple.</li><br />
            <li>Lunch: Tilapia fillet and potato wedges with steamed broccoli and cauliflower.</li><br />
            <li>Snack: Protein shake and pear.</li><br />
            <li>Dinner: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo.</li><br />
            <br />
        </div>
        <div class="header" style="color: #df73ff ">
            Sunday
        </div>
        <div class="content">
            <br />
            <li>Breakfast: Eggs sunny-side up and avocado toast with fresh fruit.</li><br />
            <li>Snack: Protein balls with almond butter and an orange.</li><br />
            <li>Lunch: Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots.</li><br />
            <li>Snack: Protein shake and strawberries.</li><br />
            <li>Dinner: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale.</li><br />
            <br />
        </div>
</asp:Content>


