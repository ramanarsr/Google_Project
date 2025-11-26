# 📘 RAG Pipeline with MCP Server for High School Science

## 📌 About

A **Retrieval-Augmented Generation (RAG) pipeline** integrated with an **MCP (Model Context Protocol) server** to help **high school students** with science-related queries.

This application is easily extensible—additional subjects can be added by placing new data files in the `server/data` folder.

The system uses **Grok LLMs via the Groq API**, with all core logic written in **Python (v3.10.8)**.

---

## 🚀 Setup Using Docker

1. Create a `.env` file in the **root folder**.

2. Add the following environment variable:

   ```env
   GROQ_API_KEY=your_groq_api_key_here
   ```

3. Start Docker Desktop.

4. Open a terminal in the **root folder** and run:

   ```bash
   docker compose up --build
   ```

---

## 🔧 Setup Without Docker

1. Create a `.env` file in the **root folder**.

2. Add the following environment variable:

   ```env
   GROQ_API_KEY=your_groq_api_key_here
   ```

3. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

4. Start the FastAPI server:

   ```bash
   uvicorn server.main:app --reload
   ```

5. Launch the Streamlit application:

   ```bash
   python -m streamlit run streamlit_app/app.py
   ```

---

## ✅ You're all set!

Your RAG + MCP pipeline should now be running and ready to assist students with science topics.
