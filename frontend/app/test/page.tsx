async function getMessage() {
  const res = await fetch(
    `${process.env.NEXT_PUBLIC_API_URL}/api/test`,
    {
      cache: "no-store"
    }
  )

  if (!res.ok) {
    throw new Error("Failed to connect to backend")
  }

  return res.json()
}

export default async function TestPage() {
  const data = await getMessage()

  return (
    <main className="p-8">
      <h1 className="text-3xl font-bold">
        Backend Connection Test
      </h1>

      <p className="mt-4">
        {data.message}
      </p>
    </main>
  )
}