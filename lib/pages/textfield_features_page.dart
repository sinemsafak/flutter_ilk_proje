import 'package:flutter/material.dart';

class TextFieldFeaturesPage extends StatefulWidget {
  const TextFieldFeaturesPage({super.key});

  @override
  State<TextFieldFeaturesPage> createState() => _TextFieldFeaturesPageState();
}

class _TextFieldFeaturesPageState extends State<TextFieldFeaturesPage> {
  // Controllers
  final TextEditingController _basicController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  // Focus
  final FocusNode _basicFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _numberFocus = FocusNode();

  // UI State
  bool _obscurePassword = true;
  bool _enabled = true;
  bool _readOnly = false;

  int _maxLines = 1;
  int _maxLength = 50;

  String _liveValue = '';
  String? _errorText;

  @override
  void initState() {
    super.initState();

    _basicController.addListener(() {
      setState(() => _liveValue = _basicController.text);
    });
  }

  @override
  void dispose() {
    _basicController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _numberController.dispose();

    _basicFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _numberFocus.dispose();
    super.dispose();
  }

  void _validateEmail(String value) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    setState(() {
      if (value.isEmpty) {
        _errorText = 'E-posta boş olamaz.';
      } else if (!emailRegex.hasMatch(value)) {
        _errorText = 'Geçerli bir e-posta gir.';
      } else {
        _errorText = null;
      }
    });
  }

  void _unfocusAll() => FocusScope.of(context).unfocus();

  void _fillDemoData() {
    setState(() {
      _basicController.text = 'Merhaba Flutter';
      _emailController.text = 'test@mail.com';
      _passwordController.text = '123456';
      _numberController.text = '42';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: _unfocusAll,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TextField Widget Özellikleri'),
          centerTitle: true,
          actions: [
            IconButton(
              tooltip: 'Demo doldur',
              onPressed: _fillDemoData,
              icon: const Icon(Icons.auto_fix_high),
            ),
            IconButton(
              tooltip: 'Klavye kapat',
              onPressed: _unfocusAll,
              icon: const Icon(Icons.keyboard_hide),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _SectionTitle(
              title: '1) Temel TextField',
              subtitle: 'controller, focusNode, onChanged, decoration',
            ),
            TextField(
              controller: _basicController,
              focusNode: _basicFocus,
              enabled: _enabled,
              readOnly: _readOnly,
              maxLines: _maxLines,
              maxLength: _maxLength,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Başlık (labelText)',
                hintText: 'İpucu (hintText)',
                helperText: 'helperText: Örnek açıklama',
                prefixIcon: const Icon(Icons.edit),
                suffixIcon: IconButton(
                  tooltip: 'Temizle',
                  onPressed: () => setState(() => _basicController.clear()),
                  icon: const Icon(Icons.clear),
                ),
              ),
              onSubmitted: (_) => _emailFocus.requestFocus(),
            ),
            const SizedBox(height: 8),
            _InfoCard(
              title: 'Canlı değer',
              child: Text(
                _liveValue.isEmpty ? 'Henüz yazı yok.' : _liveValue,
                style: theme.textTheme.bodyLarge,
              ),
            ),

            const SizedBox(height: 18),

            _SectionTitle(
              title: '2) Email TextField',
              subtitle: 'keyboardType, autofillHints, validation (errorText)',
            ),
            TextField(
              controller: _emailController,
              focusNode: _emailFocus,
              enabled: _enabled,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'E-posta',
                hintText: 'ornek@mail.com',
                prefixIcon: const Icon(Icons.email),
                errorText: _errorText,
              ),
              onChanged: _validateEmail,
              onSubmitted: (_) => _passwordFocus.requestFocus(),
            ),

            const SizedBox(height: 18),

            _SectionTitle(
              title: '3) Şifre TextField',
              subtitle: 'obscureText, suffixIcon toggle, textInputAction',
            ),
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              enabled: _enabled,
              obscureText: _obscurePassword,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Şifre',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  tooltip: _obscurePassword ? 'Göster' : 'Gizle',
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              onSubmitted: (_) => _numberFocus.requestFocus(),
            ),

            const SizedBox(height: 18),

            _SectionTitle(
              title: '4) Sayısal TextField',
              subtitle: 'keyboardType number, inputFormatters (basit örnek)',
            ),
            TextField(
              controller: _numberController,
              focusNode: _numberFocus,
              enabled: _enabled,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Sayı',
                hintText: 'Sadece sayı gir',
                prefixIcon: Icon(Icons.numbers),
              ),
              onSubmitted: (_) => _unfocusAll(),
            ),

            const SizedBox(height: 24),

            _SectionTitle(
              title: 'Ayarlar',
              subtitle: 'enabled, readOnly, maxLines, maxLength',
            ),
            _InfoCard(
              title: 'TextField Ayarları',
              child: Column(
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Enabled'),
                    subtitle: Text(_enabled ? 'Açık' : 'Kapalı'),
                    value: _enabled,
                    onChanged: (v) => setState(() => _enabled = v),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('ReadOnly'),
                    subtitle: Text(_readOnly ? 'Sadece okunur' : 'Düzenlenebilir'),
                    value: _readOnly,
                    onChanged: (v) => setState(() => _readOnly = v),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _StepperTile(
                          label: 'maxLines',
                          value: _maxLines,
                          min: 1,
                          max: 6,
                          onChanged: (v) => setState(() => _maxLines = v),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StepperTile(
                          label: 'maxLength',
                          value: _maxLength,
                          min: 10,
                          max: 200,
                          onChanged: (v) => setState(() => _maxLength = v),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            _InfoCard(
              title: 'Mini Notlar',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('• controller: metni okumak/yazmak için'),
                  Text('• focusNode: odak yönetimi (next/done)'),
                  Text('• decoration: label/hint/prefix/suffix/error'),
                  Text('• enabled/readOnly: etkileşim kontrolü'),
                  Text('• obscureText: şifre gizleme'),
                  Text('• maxLines/maxLength: çok satır/karakter sınırı'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(subtitle, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _InfoCard({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}

class _StepperTile extends StatelessWidget {
  final String label;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const _StepperTile({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  tooltip: 'Azalt',
                  onPressed: value > min ? () => onChanged(value - 1) : null,
                  icon: const Icon(Icons.remove),
                ),
                Expanded(
                  child: Center(child: Text('$value')),
                ),
                IconButton(
                  tooltip: 'Arttır',
                  onPressed: value < max ? () => onChanged(value + 1) : null,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
