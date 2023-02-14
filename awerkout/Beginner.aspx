<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="Beginner.aspx.cs" Inherits="awerkout.Beginner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="workoutplandetailstyle.css" />
    <style type="text/css">
        .auto-style2 {
            font-size: large;
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
    <div class="header">
        <img src="Images/Beginner header.PNG" id="imgheader"/>
        <div id="txt"> 
            Beginner Full Body Workout Routine for Men 
            <br />
            <br />
            <div class="auto-style2">
            We shall begin with a workout routine that 
            is best suited for people who are new to the 
            fitness domain. So, you may consider this as 
            a beginner-level workout routine for men. </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="content daytxt">
        Day 1: Chest, Back, Shoulders, Legs, Biceps, Triceps Gym Workout Plan
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/1.gif" />
                Chest workout – Barbell Bench Press – target 4 sets of 8 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/2.png" />
                Back workout – Lat-pulldowns – target 4 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/3.jpg" />
                Shoulders workout – Seated Dumbbell Press – target 4 sets of 10 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/4.png" />
                Legs workout – Leg Extensions – target 4 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/5.gif" />
                Biceps workout – Barbell Bicep Curls – target 3 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/6.jpg" />
                Triceps workout – Triceps Rope Pushdowns – target 3 sets of 15 reps
            </div>
        </div>


    </div>

    <div class="content daytxt">
        Day 2: Legs, Triceps, Biceps, Chest, Back, Shoulder Gym Routine for Men
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/7.png" />
                Legs workout – Leg Press Machine – target 4 sets of 8 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/8.jpg" />
                Triceps workout – Overhead Bar Extensions – target 3 sets of 20 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/9.jpg" />
                Biceps workout – EZ Bar Curls – target 4 sets of 10 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/10.gif" />
                Chest workout – Machine Chest Press – target 4 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/11.gif" />
                Back workout – T-Bar Row – target 4 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/12.gif" />
                Shoulders workout – Lateral Raises – target 3 sets of 20 reps
            </div>
        </div>


    </div>
    <div class="content daytxt">
        Day 3: Shoulders, Back, Chest, Legs, Triceps, Biceps
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/13.gif" />
                Shoulders workout – EZ Bar Upright Rows – target 3 sets of 15 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/14.gif" />
                Back workout – Close-Grip Pulldowns – target 4 sets of 12 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/15.gif" />
                Chest workout – Cable Fly – target 4 sets of 10 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/16.gif" />
                Legs workout – Lunges – target 3 sets of 10 reps per leg

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/17.gif" />
                Triceps workout – Skullcrushers – target 3 sets of 15 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/18.gif" />
                Biceps workout – Hammer Curls – target 3 sets of 12 reps
            </div>
        </div>


    </div>
</asp:Content>
