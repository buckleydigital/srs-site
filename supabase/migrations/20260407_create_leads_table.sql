-- Create leads table for storing form submissions
CREATE TABLE IF NOT EXISTS public.leads (
  id            bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name    text,
  last_name     text,
  email         text,
  phone         text,
  postcode      text,
  is_homeowner  boolean,
  avg_quarterly_bill text,
  purchase_timeline  text,
  matched_buyer      text,
  matched_buyer_id   text,
  source        text,
  campaign      text,
  submitted_at  timestamptz DEFAULT now(),
  created_at    timestamptz DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE public.leads ENABLE ROW LEVEL SECURITY;

-- Allow anonymous inserts (the website uses the anon key to insert leads)
CREATE POLICY "Allow anonymous inserts" ON public.leads
  FOR INSERT
  TO anon
  WITH CHECK (true);

-- Optional: allow authenticated users to read leads
CREATE POLICY "Allow authenticated reads" ON public.leads
  FOR SELECT
  TO authenticated
  USING (true);
