public Analytics {
	private static _instance: Analytics;

	private Analytics() { }

	public static getInstance(): Analytics {
		if (!Analytics._instance)
			Analytics._instance = new Analytics();

		return Analytics._instance;
	}
}
