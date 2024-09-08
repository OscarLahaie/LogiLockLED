﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LedCSharp;

namespace LogiLockLED
{
    public class LogitechSDKController : ILedController
    {
        public bool Initialise()
        {
            bool res = LogitechGSDK.LogiLedInitWithName("LogiLockLED");            
            LogitechGSDK.LogiLedSetTargetDevice(LogitechGSDK.LOGI_DEVICETYPE_PERKEY_RGB);
            LogitechGSDK.LogiLedSaveCurrentLighting();            
            LogitechGSDK.LogiLedStopEffects();
            
            return res;
        }

        public void Shutdown()
        {
            LogitechGSDK.LogiLedRestoreLighting();
            LogitechGSDK.LogiLedShutdown();
        }

        public bool SetLockKeyColor(LockKey key, System.Drawing.Color color)
        {
            keyboardNames keyCode;
            switch (key)
            {
                case LockKey.Num:
                    keyCode = keyboardNames.NUM_LOCK;
                    break;

                case LockKey.Caps:
                    keyCode = keyboardNames.CAPS_LOCK;
                    break;

                case LockKey.Scroll:
                    keyCode = keyboardNames.SCROLL_LOCK;
                    break;

                case LockKey.Mute:
                    keyCode = keyboardNames.NUM_ASTERISK;
                    break;

                case LockKey.PrtSc:
                    keyCode = keyboardNames.PRINT_SCREEN;
                    break;

                case LockKey.F12:
                    keyCode = keyboardNames.F12;
                    break;

                case LockKey.Num_Asterisk:
                    keyCode = keyboardNames.NUM_ASTERISK;
                    break;

                default:
                    return false;
            }
            
            return LogitechGSDK.LogiLedSetLighting(color.R * 100 / 255, color.G * 100 / 255, color.B * 100 / 255);
        }      
       
    }
}
