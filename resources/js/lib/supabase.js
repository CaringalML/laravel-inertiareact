import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
    console.error('Missing Supabase env vars:', { supabaseUrl, supabaseAnonKey });
}

// Singleton to prevent multiple instances during Vite HMR
let supabaseInstance = null;

function getSupabaseClient() {
    if (!supabaseInstance) {
        supabaseInstance = createClient(supabaseUrl, supabaseAnonKey, {
            realtime: {
                params: {
                    eventsPerSecond: 10,
                },
            },
        });
    }
    return supabaseInstance;
}

export const supabase = getSupabaseClient();
